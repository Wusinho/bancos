require 'rails_helper'

def provider_partial(bank)
  ApplicationController.render(partial: 'providers/provider', locals: { provider: provider }).to_s
end

RSpec.describe "Providers", type: :request do
  let!(:user) { create(:user)}
  let!(:user2) { create(:user)}

  describe "GET /index" do
    context "when user is signed in" do
      let!(:provider1) { create :provider }
      let!(:provider2) { create :provider }
      let!(:provider3) { create :provider, user: user2 }

      before do
        sign_in user
      end

      it 'it include all the current_user banks' do
        get providers_path
        card_provider1 = provider_partial(provider1)
        card_provider2 = provider_partial(provider2)

        expect(response.body).to include(card_provider1, card_provider2)
      end

      it 'should not include other users providers' do
         get banks_path
         card_provider3 = provider_partial(provider3)
         expect(response.body).not_to include(card_provider3)
      end

    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/providers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
