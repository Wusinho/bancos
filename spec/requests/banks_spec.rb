require 'rails_helper'

def partial_bank(bank)
  ApplicationController.render(partial: 'banks/bank', locals: { bank: bank }).to_s
end

RSpec.describe "Banks", type: :request do
  let!(:user) { create(:user)}
  let!(:user2) { create(:user)}

  describe "GET /index" do
    context 'when user is signed in' do
      let!(:bank1) { create :bank, name: 'bank 1', user:  }
      let!(:bank2) { create :bank, name: 'bank 2', user:  }

      before do
        sign_in user
      end

      it 'should include all the current_uesr banks' do
        get banks_path
        card_bank1 = partial_bank(bank1)
        card_bank2 = partial_bank(bank2)

        expect(response.body).to include(card_bank1, card_bank2)

      end

    end

  end
end
