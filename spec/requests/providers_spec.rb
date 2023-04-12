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
        post providers_path, params: { provider: { name: '', nit: provider_params[:nit]  } }
        p response.body

        expect(response.body).to include('error_message','Name is too short (minimum is 3 characters)')
      end

      it 'renders the error message when nit number is  not 9 digits' do
        post providers_path, params: { provider: { name: provider_params[:name], nit: '123' } }

        # expect(response.body).to include('error_message','nit is the wrong length (should be 15 characters)')
      end
    end

    context 'when user is not signed in' do
      let(:provider_params) { FactoryBot.attributes_for(:provider) }

      it 'redirects to sign in page' do
        post providers_path, params: { provider: provider_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end