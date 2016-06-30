require 'csv'

class CustomerShippingAddress < ActiveRecord::Base
  validates :first_name, :last_name, :address, :city, :state, :zip_code, presence: true

  def self.import(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      obj_hash = {
        first_name: row[0],
        last_name: row[1],
        address: row[2],
        city: row[3],
        state: row[4],
        zip_code: row[5]
      }
      CustomerShippingAddress.create!(obj_hash)
    end
  end

  def self.validate_import(file_path)
    CustomerShippingAddress.get_validation_warnings(file_path) == []
  end

  def self.get_validation_warnings(file_path)
    warnings = []
    CSV.foreach(file_path, headers: true) do |row|
      row.headers.each do |header|
        warnings.push("#{header} is required for all records") if !row.field(header).present? && !warnings.include?("#{header} is required for all records")
      end
    end
    warnings
  end
end
