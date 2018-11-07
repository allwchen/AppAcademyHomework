require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries #{title => salary}
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(startup)
    return @funding > startup.funding
  end

  def hire(employee_name, title)
    if !valid_title?(title)
      raise "Title of new employee is not valid for hiring"
    else
      @employees << Employee.new(employee_name, title)
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = @salaries[employee.title]
    if @funding > salary
      employee.pay(salary)
      @funding -= salary
    else
      raise "Not enough funding to pay #{employee.name} his salary ($#{salary})"
    end
  end

  def payday
    @employees.each { |emp| pay_employee(emp) }
  end

  def average_salary
    sum_salaries = 0
    @employees.each { |emp| sum_salaries += @salaries[emp.title] }
    num_employees = self.size
    if num_employees > 0
      return sum_salaries * 1.0 / num_employees
    else
      return 0
    end
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    #add funding
    @funding += startup.funding
    #merge salaries
    startup.salaries.each do |title, salary|
      if valid_title?(title)
        # already exists, do nothing
      else
        @salaries[title] = salary
      end
    end
    #add employees
    @employees += startup.employees
    #close startup
    startup.close
  end
end
