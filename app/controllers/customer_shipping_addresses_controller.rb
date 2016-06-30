class CustomerShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = CustomerShippingAddress.all
  end

  def import
    if params['addresses']
      address_data = params['addresses'].tempfile
      CustomerShippingAddress.import(address_data)
      redirect_to root_url, notice: "Addresses imported."
    else
      redirect_to root_url, notice: "Please select a file to import."
    end
  end
end
