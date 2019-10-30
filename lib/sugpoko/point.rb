module Sugpoko
  class Point
    attr_accessor :x, :y

    def initialize(*args)
      if args[0].is_a?(Hash)
        @x, @y = identify(args[0])
      else
        @x, @y = identify(args)
      end
    end

    def +(obj)
      id_x, id_y = identify obj
      self.class.new x + id_x, y + id_y
    end

    def -(obj)
      self.class.new x - obj.x, y - obj.y
    end

    def ==(obj)
      x == obj.x && y == obj.y
    end

    def to_s
      "[#{x}, #{y}]"
    end

    def to_ary
      [x, y]
    end

    private

    def identify(obj)
      case obj.class.to_s
      when 'Array'
        obj
      when 'Hash'
        [ obj[:x], obj[:y] ]
      else # assumes an object that responds to 'x' and 'y'
        [ obj.x, obj.y ]
      end
    end
  end
end
