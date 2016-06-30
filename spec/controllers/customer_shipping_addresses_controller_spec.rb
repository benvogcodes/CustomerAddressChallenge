require 'rails_helper'

RSpec.describe CustomerShippingAddressesController, type: :controller do
  describe 'GET #index' do
    it 'populates an array of all CustomerShippingAddresses' do
    end

    it 'renders the index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #import' do
    let(:bad_uploaded) do
      ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join('spec/support/customer_shipping_addresses_BAD.csv')))
    end
    let(:good_uploaded) do
      ActionDispatch::Http::UploadedFile.new(tempfile: File.new(Rails.root.join('spec/support/customer_shipping_addresses.csv')))
    end

    context "with params['addresses']" do
      context 'import validation succeeds' do
        it 'redirects to index with a notice that addresses were imported' do
          post :import, addresses: good_uploaded
          expect(response).to redirect_to root_url
          expect(flash[:notice]).to eq('Addresses imported')
        end
      end

      context 'import validation fails' do
        it 'redirects to index with a notice that import failed validation' do
          post :import, addresses: bad_uploaded
          expect(response).to redirect_to root_url
          expect(flash[:notice]).to eq('Import failed validation')
        end

        it 'redirects to index showing the validation errors that occured' do
          post :import, addresses: bad_uploaded
          expect(response).to redirect_to root_url
          expect(flash[:error]).to be_present
        end
      end
    end

    context "without params['addresses']" do
      it 'redirects to index with a notice to select a file to import' do
        post :import
        expect(response).to redirect_to root_url
      end
    end
  end
end
