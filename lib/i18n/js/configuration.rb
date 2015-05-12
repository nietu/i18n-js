module I18n
  module JS
    class Configuration
      ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS = {
      }.freeze

      attr_accessor *ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS.keys

      def initialize
        self.class::ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS.each do |attribute_name, default_value|
          public_send("#{attribute_name}=", default_value)
        end
      end
    end
  end
end
