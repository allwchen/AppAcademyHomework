class Dog
  def initialize (name, breed, age, bark, favorite_foods)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_foods
  end

  def name
    return @name
  end

  def breed
    return @breed
  end

  def age
    return @age
  end

  def age=(num)
    @age = num
  end

  def bark
    if @age > 3
      return @bark.upcase
    else
      return @bark.downcase
    end
  end

  def favorite_foods
    return @favorite_foods
  end

  def favorite_food?(food)
    @favorite_foods.map{|el| el.downcase}.include?(food.downcase)
  end

end
