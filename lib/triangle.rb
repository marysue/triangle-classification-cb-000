class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    if has3Sides? && passesTriangleInequality?
      if isEquilateral?
        :equilateral
      elsif isIsosceles?
        :isosceles
      elsif isScalene?
        :scalene
      end
    else
        begin
          raise TriangleError
        #testing does not want to see custom
        #error.  Triangle::TriangleError is
        #all testing expects.  
        #Triangle::TriangleError: Custom triangle error
        #from C:/atom/raketest/lib/triangle.rb:22:in `kind'

        #custom error suppresses this and only
        #prints out the error message in 
        #message method:
        #[37] pry(main)> t.kind
        #Custom triangle error
        #=> false

        #rescue TriangleError => error
        #  puts error.message
        #  false
        end
      end
  end

  def passesTriangleInequality?
    #find greatest side
    if (@side1 >= @side2) && (@side1 >= @side3)
      #@side1 is greatest side so sum is @side2 + @side3
      if @side1 < (@side2 + @side3)
        true
      else
        false
      end
    elsif (@side2 >= @side1) && (@side2 >= @side3)
      #@side2 is greatest side so sum is @side1 + @side3
      if (@side2 < (@side1 + @side3))
        true
      else
        false
      end
    else #@side3 is the greatest sides
      #@side 3 is greatest side so sum is @side2 + @side1
      if (@side3 < (@side1 + @side2))
        true
      else
        false
      end
    end
  end

  def has3Sides?
    if @side1 > 0 && @side2 > 0 && @side3 > 0
      true
    else
      false
    end
  end

  def isEquilateral?
    if (@side1 == @side2) && (@side2 == @side3)
      true
    else
      false
    end
  end

  def isIsosceles?
    #only one side is different
    if ((@side1 != @side2) || (@side1 != @side3)) &&
      #and two sides are the same
      ((@side1 == @side2) || (@side1 == @side3) || (@side2 == @side3))
      :isosceles
    end
  end

  def isScalene?
    #no sides are the same length
    if (@side1 != @side2) && (@side1 != @side3) && (@side2 != @side3)
      true
    else
      false
    end
  end

  class TriangleError < StandardError
    def message
      "Custom triangle error"
    end
  end

end
