module Sugpoko
  class Base
    attr_reader :pdf, :data

    include Prawn::View

    def generate
      raise '#generate not defined'
    end

    def draw(klass, options = {})
      klass.new(options.merge(pdf: pdf)).generate
    end

    def initialize(options = {})
      @data = options[:data]
      @pdf = self
    end

    def document
      @document ||= Prawn::Document.new(default_options)
    end

    def default_options
      @default_options ||= {
        page_size: [8.5.in, 11.in],
        page_layout: :portrait
      }
    end

  end
end
