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

      before do
        sign_in user
      end

      it 'creates a new provider' do
        expect do
          post providers_path, params: { provider: provider_params }
        end.to change(Provider, :count).by(1)
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

        expect(response.body).to include('error_message',"Name can&#39;t be blank")
      end

      it 'renders the error message when nit number is  not 9 digits' do
        provider_params[:nit] = 123
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('error_message','Nit is too short (minimum is 9 characters) and Nit must have correct format')
      end

      it 'renders the error message when nit number is  wrong format' do
        provider_params[:nit] = '123456789*1'
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('error_message','Nit must have correct format')
      end

      it 'renders the error message when phone number do not pass validations' do
        provider_params[:phone] = '123456789234561'
        post providers_path, params: { provider: provider_params }

        expect(response.body).to include('error_message','Phone is too long (maximum is 10 characters)')
      end
    end

  end

end