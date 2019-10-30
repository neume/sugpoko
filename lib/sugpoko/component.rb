require "sugpoko/helpers/prawn"

class Sugpoko::Component
  include Sugpoko::Helpers::Prawn
  attr_reader :pdf, :cursor_origin, :position, :data, :width, :height

  def generate
    raise '#generate not defined'
  end

  def draw(klass, options = {})
    klass.new(base_attributes.merge(options)).generate
  end

  def base_attributes
    {
      pdf: pdf,
      width: width,
      height: height,
      position: [0, pdf.cursor],
      data: data
    }
  end

  def initialize(options = {})
    @pdf = options.fetch(:pdf)
    @width = options.fetch(:width)
    @height = options.fetch(:height)
    initialize_position(options.fetch(:position))
    configure(options)
  end

  def initialize_position(point)
    if point
      @position = Sugpoko::Point.new *point
    else
      @position = Sugpoko::Point.new 0, pdf.cursor
    end
  end

  def configure(options = {})
    # override this for other initialization process
  end
end
