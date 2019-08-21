class Prawnko::Component
  attr_reader :pdf, :cursor_origin

  def generate
    raise '#generate not defined'
  end

  def draw(klass, options = {})
    klass.new(options.merge(pdf: pdf)).generate
  end

  def initialize(options = {})
    @pdf = options.fetch(:pdf)
    @cursor_origin = pdf.cursor
  end
end
