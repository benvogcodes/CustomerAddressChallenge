require 'rails_helper'

RSpec.describe CustomerShippingAddress, type: :model do
  let(:address1){ build(:customer_shipping_address) }
  let(:address2){ build(:customer_shipping_address, first_name: nil) }
  let(:address3){ build(:customer_shipping_address, last_name: nil) }
  let(:address4){ build(:customer_shipping_address, address: nil) }
  let(:address5){ build(:customer_shipping_address, city: nil) }
  let(:address6){ build(:customer_shipping_address, state: nil) }
  let(:address7){ build(:customer_shipping_address, zip_code: nil) }
  let(:bad_import){ File.join('spec', 'support', 'customer_shipping_addresses_BAD.csv') }
  let(:good_import){ File.join('spec', 'support', 'customer_shipping_addresses.csv') }


  context "create" do
    it "is valid with a first_name, last_name, address, city, state and zip_code" do
      expect(address1.valid?).to eq(true)
    end

    it "is invalid without a first_name" do
      expect(address2.valid?).to eq(false)
    end

    it "is invalid without a last_name" do
      expect(address3.valid?).to eq(false)
    end

    it "is invalid without an address" do
      expect(address4.valid?).to eq(false)
    end

    it "is invalid without a city" do
      expect(address5.valid?).to eq(false)
    end

    it "is invalid without a state" do
      expect(address6.valid?).to eq(false)
    end

    it "is invalid without a zip_code" do
      expect(address7.valid?).to eq(false)
    end
  end

  context "import" do
    it "creates an object for every non-header row in the import file" do
      expect(CustomerShippingAddress.count).to eq(0)
      CustomerShippingAddress.import(good_import)
      expect(CustomerShippingAddress.count).to eq(500)
    end
  end

  context "validate_import" do
    it "returns true if there are no validation warnings" do
      expect(CustomerShippingAddress.validate_import(good_import)).to eq(true)
    end

    it "returns false if there are any validation warnings" do
      expect(CustomerShippingAddress.validate_import(bad_import)).to eq(false)
    end
  end

  context "get_validation_warnings" do
    it "returns an array with validation warnings if any column values are not present" do
      expect(CustomerShippingAddress.get_validation_warnings(bad_import)).to eq(["city is required for all records", "state is required for all records", "zip is required for all records", "fname is required for all records"])
    end

    it "returns an empty array if all column values are present" do
      expect(CustomerShippingAddress.get_validation_warnings(good_import)).to eq([])
    end
  end
end
