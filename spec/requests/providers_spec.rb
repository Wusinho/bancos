require 'rails_helper'

def provider_partial(provider)
  ApplicationController.render(partial: 'providers/provider', locals: { provider: provider }).to_s
end

RSpec.describe "Providers", type: :request do
  let!(:user) { create(:user)}
  let!(:user2) { create(:user)}

  describe "GET /index" do
    context "when user is signed in" do
      let!(:provider1) { create :provider, user: user }
      let!(:provider2) { create :provider, user: user }
      let!(:provider3) { create :provider, user: user2 }

      before do
        sign_in user
      end

      it 'it include all the current_user providers' do
        get providers_path

        card_provider1 = provider_partial(provider1)
        card_provider2 = provider_partial(provider2)

        expect(response.body).to include(card_provider1, card_provider2)
      end

      it 'should not include other users providers' do
         get providers_path
         card_provider3 = provider_partial(provider3)
         expect(response.body).not_to include(card_provider3)
      end

    end
  end

  describe 'Post /create' do
    context 'when user is logged in' do
      let(:provider_params) { FactoryBot.attributes_for(:provider) }

      let(:valid_params) do
        {
          provider: {
            name: "Provider Name",
            contact_name: "Contact Name",
            nit: "123456789",
            phone: "123456789",
            user_id: user.id,
            banks_attributes: {
              "0": { name: "Bank 1", account: "123456789123456" },
              "1": { name: "Bank 2", account: "223456789123456" }
            }
          }
        }
      end

      before do
        sign_in user
      end

      it 'creates a new provider' do
        expect do
          post providers_path, params: { provider: provider_params }
        end.to change(Provider, :count).by(1)
      end

      it "creates a new Provider with Banks" do
        expect do
          post providers_path, params: valid_params
        end.to change(Provider, :count).by(1).and change(Bank, :count).by(2)
      end

      it 'returns a successful response' do
        post providers_path, params: { provider: provider_params }
        expect(response).to be_successful
        provider = Provider.first
        card = provider_partial(provider)
        expect(response.body).to include(card)
      end

      it 'returns the correct turbo stream responses' do
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('turbo-stream')
        expect(response.body).to include('providers')
        expect(response.body).to include('provider_form')

        expect(response.body).to include('prepend', 'provider')
        expect(response.body).to include('replace', 'provider_form')
      end

      it 'renders the error message when no name' do
        provider_params[:name] = ''
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('error_message',"Nombre de Proveedor no puede estar vacío")
      end

      it 'renders the error message when nit number is  not 9 digits' do
        provider_params[:nit] = 123
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('error_message','NIT es demasiado corto and NIT debe tener el formato correcto')
      end

      it 'renders the error message when nit number is  wrong format' do
        provider_params[:nit] = '123456789*1'
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('error_message','NIT debe tener el formato correcto')
      end

      it 'renders the error message when phone number do not pass validations' do
        provider_params[:phone] = '123456789234561'
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('error_message','Telefono es demasiado largo')
      end
    end
  end
end
