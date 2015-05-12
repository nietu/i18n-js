require "spec_helper"

describe I18n::JS::Configuration do
  describe "constants" do
    it "has default export directory" do
      expect(described_class::DEFAULT_EXPORT_DIR_PATH).to eql("public/javascripts")
    end
  end


  describe "default values" do
    subject(:model) { described_class.new }

    described_class::ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS.each do |attribute_name, default_value|
      context "for attribute #{attribute_name}" do
        subject { model.public_send(attribute_name) }

        it {should eq(default_value)}
      end
    end
  end

  describe "configurable attributes" do
    subject(:model) { described_class.new }

    described_class::ATTRIBUTE_NAME_AND_DEFAULT_VALUE_MAPPINGS.each_key do |attribute_name|
      context "for attribute #{attribute_name}" do
        let(:attribute_name) { attribute_name }
        let(:new_value) { :dummy_value_for_attribute }

        subject { model.public_send(attribute_name) }

        before do
          expect(model.public_send(attribute_name)).to_not eq(new_value)
          model.public_send("#{attribute_name}=", new_value)
        end

        it {should eq(new_value)}
      end
    end


    describe "#export_i18n_js_dir_path" do
      subject { instance.export_i18n_js_dir_path }

      let(:instance) { described_class.new }

      let(:default_path) { described_class::DEFAULT_EXPORT_DIR_PATH }
      let(:new_path) { File.join("tmp", default_path) }

      after { instance.send(:remove_instance_variable, :@export_i18n_js_dir_path) }

      context "when it is not set" do
        it { should eq default_path }
      end
      context "when it is set to another path already" do
        before { instance.export_i18n_js_dir_path = new_path }

        it { should eq new_path }
      end
      context "when it is set to nil already" do
        before { instance.export_i18n_js_dir_path = nil }

        it { should eq :none }
      end
    end
  end
end
