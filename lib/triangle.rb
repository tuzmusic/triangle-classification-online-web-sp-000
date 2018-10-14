class Triangle
  attr_accessor :sides

  def initialize(side1, side2, side3)
    @sides = [side1, side2, side3]
  end

  def kind
    if !self.valid?
      # raise_error
      raise TriangleError
      return
    end
    return :equilateral if sides[0] == sides[1] && sides[1] == sides[2]
    return :isosceles if sides[0] == sides[1] || sides[0] == sides[2] || sides[2] == sides[1]
    return :scalene
  end

  def raise_error
    begin
      raise TriangleError
    rescue TriangleError => error
      puts error.message
    end
  end

  def valid?
    # The sum of the lengths of any two sides of a triangle always exceeds the length of the third side.
    s = @sides
    s.all? {|s| s > 0} && (s[0]+s[1]>s[2]) && (s[0]+s[2]>s[1]) && (s[1]+s[2]>s[0])
  end

  class TriangleError < StandardError
    def message
      "The triangle is invalid"
    end
  end

end
