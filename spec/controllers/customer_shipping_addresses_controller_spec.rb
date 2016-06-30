require 'rails_helper'

RSpec.describe CustomerShippingAddressesController, type: :controller do
  describe 'GET #index' do
    it "populates an array of all CustomerShippingAddresses" do

    end

    it 'renders the index view' do

    end
  end

  describe 'POST #import' do
    context "with params['addresses']" do
      context 'import validation succeeds' do
        it 'rerenders the index view with a notice that addresses were imported' do

        end
      end

      context 'import validation fails' do
        it 'rerenders the index view with a notice that import failed validation' do

        end

        it 'rerenders the index view showing the validation errors that occured' do

        end
      end
    end

    context "without params['addresses']" do
      it 'rerenders the index view with a notice to select a file to import' do

      end
    end
  end
end
