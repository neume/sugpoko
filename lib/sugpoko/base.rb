module Sugpoko
  class Base
    attr_reader :pdf, :data, :page_size

    include Prawn::View

    def generate
      raise '#generate not defined'
    end

    def draw(klass, options = {})
      klass.new(base_attributes.merge(options)).generate
    end

    def base_attributes
      {
        pdf: pdf,
        width: width - margin * 2,
        height: height - margin * 2,
        position: [0, pdf.cursor],
        data: data
      }
    end

    def initialize(options = {})
      @data = options[:data]
      @pdf = self
      configure options
    end

    def configure(options = {})
    end

    def width
      8.5.in
    end

    def height
      11.in
    end

    def margin
      0.5.in
    end

    def document
      @document ||= Prawn::Document.new(default_options)
    end

    def default_options
      @default_options ||= {
        page_size: [width, height],
        page_layout: :portrait
      }
    end

  end
end
