class Card
  attr_reader :face_down, :value
  def initialize (value)
    @value = value
    @face_down = true
  end

  def hide
    @face_down = true
  end

  def reveal
    @face_down = false
    @value
  end

  def revealed?
    @face_down == false
  end

  def display
    if @face_down==true
      print "?"
    else
      print @value
    end
  end

  def to_s
    @facedown ? "?" : value.to_s
  end

  def ==(object)
    object.is_a?(self.class) && @value == object.value
  end

end
