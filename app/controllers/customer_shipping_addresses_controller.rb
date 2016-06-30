class CustomerShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = CustomerShippingAddress.all
  end

  def import
    if params['addresses']
      address_data = params['addresses'].tempfile
      if CustomerShippingAddress.validate_import(address_data)
        CustomerShippingAddress.import(address_data)
        redirect_to root_url, notice: "Addresses imported."
      else
        flash[:error] =  CustomerShippingAddress.get_validation_warnings(address_data)
        redirect_to root_url, notice: "Import failed validation"
      end
    else
      redirect_to root_url, notice: "Please select a file to import"
    end
  end
end
