class CustomerShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = CustomerShippingAddress.all
  end

  def import
    address_data = params['addresses'].tempfile
    CustomerShippingAddress.import(address_data)
    redirect_to root_path
  end
end
