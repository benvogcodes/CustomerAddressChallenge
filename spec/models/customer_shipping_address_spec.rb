require 'rails_helper'

RSpec.describe CustomerShippingAddress, type: :model do
  context "create" do
    it "is valid with a first_name, last_name, address, city, state and zip_code"
    it "is invalid without a first_name"
    it "is invalid without a last_name"
    it "is invalid without an address"
    it "is invalid without a city"
    it "is invalid without a state"
    it "is invalid without a zip_code"
  end

  context "import" do
    it "creates an object for every non-header row in the import file"
  end

  context "validate_import" do
    it "returns true if there are no validation warnings"
    it "returns false if there are any validation warnings"
  end

  context "get_validation_warnings" do
    it "returns an array with validation warnings if any column values are not present"
    it "returns an empty array if all column values are present"
  end
end
