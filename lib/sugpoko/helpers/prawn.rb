module Sugpoko
  module Helpers
    module Prawn
      def bounding_box(options = {})
        pos, options = build_bounding_box_options(options)
        pdf.bounding_box pos, options do
          yield
        end
      end

      def build_bounding_box_options(options)
        pos = options.fetch(:position) { position }
        bounding_box_options = {
          width: width,
          height: height
        }
        bounding_box_options.merge! options
        return pos, bounding_box_options
      end
    end
  end
end
