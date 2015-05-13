module I18n
  module JS
    class Configuration
      DEFAULT_EXPORT_DIR_PATH = "public/javascripts"


      ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS = {
      }.freeze

      attr_accessor *ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS.keys

      def initialize
        self.class::ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS.each do |attribute_name, default_value|
          public_send("#{attribute_name}=", default_value)
        end
      end

      # Custom accessors

      def export_i18n_js?
        export_i18n_js_dir_path.is_a?(String)
      end

      def export_i18n_js_dir_path
        @export_i18n_js_dir_path ||= DEFAULT_EXPORT_DIR_PATH
      end

      ## Setting this to nil would disable i18n.js exporting
      def export_i18n_js_dir_path=(new_path)
        new_path = :none unless new_path.is_a?(String)
        @export_i18n_js_dir_path = new_path
      end

      def sort_translation_keys?
        @sort_translation_keys = true if @sort_translation_keys.nil?
        @sort_translation_keys
      end

      def sort_translation_keys=(value)
        @sort_translation_keys = !!value
      end

      def use_fallbacks?
        fallbacks != false
      end

      def fallbacks
        return @fallbacks if instance_variable_defined?(:@fallbacks)
        true
      end

      def fallbacks=(value)
        @fallbacks = value
      end

      # The name is a bit confusing
      # This is not actual translations, but config about translations to include/exclude
      def translations
        return @translations if instance_variable_defined?(:@translations)

        [
          {
            file: "#{DEFAULT_EXPORT_DIR_PATH}/translations.js",
          }
        ]
      end

      def translations=(value)
        @translations = value
      end
    end
  end
end
