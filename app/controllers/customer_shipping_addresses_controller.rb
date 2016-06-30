require 'csv'

class CustomerShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = CustomerShippingAddress.all
  end

  def import
    address_data = params['addresses'].tempfile

    CSV.foreach(address_data, :headers => true) do |row|
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

    redirect_to root_path
  end
end
