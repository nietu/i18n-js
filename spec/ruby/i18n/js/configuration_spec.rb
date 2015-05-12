require "spec_helper"

describe I18n::JS::Configuration do
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
  end
end
