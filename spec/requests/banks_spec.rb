require 'rails_helper'

def partial_bank(bank)
  ApplicationController.render(partial: 'banks/bank', locals: { bank: bank }).to_s
end

RSpec.describe "Banks", type: :request do
  let!(:user) { create(:user)}
  let!(:user2) { create(:user)}

  describe "GET /index" do
    context 'when user is signed in' do
      let!(:bank1) { create :bank, name: 'bank 1', user: }
      let!(:bank2) { create :bank, name: 'bank 2', user: }
      let!(:bank3) { create :bank, name: 'bank 3', user: user2 }

      before do
        sign_in user
      end

      it 'it include all the current_user banks' do
        get banks_path
        card_bank1 = partial_bank(bank1)
        card_bank2 = partial_bank(bank2)
        expect(response.body).to include(card_bank1, card_bank2)
      end

      it 'should not include other users banks' do
        get banks_path
        card_bank3 = partial_bank(bank3)
        expect(response.body).not_to include(card_bank3)
      end

    end
  end

  describe 'Post /create' do
    context 'when user is logged in' do
      let(:bank_params) { FactoryBot.attributes_for(:bank) }

      before do
        sign_in user
      end

      it 'creates a new bank' do
        expect do
          post banks_path, params: {bank: bank_params }
        end.to change(Bank, :count).by(1)
      end

      it 'returns a successful response' do
        post banks_path, params: { bank: bank_params }
        expect(response).to be_successful
        bank = Bank.first
        card = partial_bank(bank)
        expect(response.body).to include(card)
      end

      it 'returns the correct turbo stream responses' do
        post banks_path, params: { bank: bank_params }

        expect(response.body).to include('turbo-stream')
        expect(response.body).to include('banks')
        expect(response.body).to include('bank_form')

        expect(response.body).to include('prepend', 'bank')
        expect(response.body).to include('replace', 'bank_form')
      end

      it 'renders the error message when it does not pass validations' do
        post banks_path, params: { bank: { title: 'a' } }

        expect(response.body).to include('error_message','Name can&#39;t be blank and Name is too short (minimum is 3 characters)')
      end
    end

    context 'when user is not signed in' do
      let(:bank_params) { FactoryBot.attributes_for(:bank) }

      it 'redirects to sign in page' do
        post banks_path, params: { bank: bank_params }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


  describe 'PATCH /banks/:id' do
    context 'when user is authenticated' do
      let(:user) { create(:user) }
      let(:bank) { create(:bank, user:) }
      before do
        sign_in user
      end

      context 'with valid params' do
        it 'updates the bank' do
          old_title = bank.title

          patch banks_path(bank), params: { bank: { name: 'Updated Title' } }
          expect(bank.reload.title).to eq('Updated Title')
          expect(bank.reload.title).not_to eq(old_title)
        end
      end

      context 'with invalid params' do
        it 'renders the error message' do
          patch bank_path(bank), params: { bank: { title: '' } }

          expect(response.body).to include('error_message')
          expect(response.body).to include('Title can&#39;t be blank')
        end
      end
    end
  end
end

