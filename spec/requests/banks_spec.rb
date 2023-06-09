require 'rails_helper'

def partial_bank(bank)
  ApplicationController.render(partial: 'banks/bank', locals: { bank: bank }).to_s
end

RSpec.describe "Banks", type: :request do
  let!(:user) { create(:user)}
  let!(:user2) { create(:user)}
  let!(:provider) { create(:provider, user: user)}
  let!(:provider2) { create(:provider, user: user2)}

  describe "GET /index" do
    context 'when user is signed in' do
      let!(:bank1) { create :bank, provider: provider }
      let!(:bank2) { create :bank, provider: provider2 }

      before do
        sign_in user
      end

      it 'it include all the current_user banks' do
        get banks_path
        card_bank1 = partial_bank(bank1)
        expect(response.body).to include(card_bank1)
      end

      it 'should not include other users banks' do
        get banks_path
        card_bank2 = partial_bank(bank2)
        expect(response.body).not_to include(card_bank2)
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
          bank_params[:provider_id] = provider.id
          post banks_path, params: {bank: bank_params }
        end.to change(Bank, :count).by(1)
      end

      it 'returns a successful response' do
        bank_params[:provider_id] = provider.id
        post banks_path, params: { bank: bank_params }
        expect(response).to be_successful
        bank = Bank.first
        card = partial_bank(bank)
        expect(response.body).to include(card)
      end

      it 'returns the correct turbo stream responses' do
        bank_params[:provider_id] = provider.id
        post banks_path, params: { bank: bank_params }

        expect(response.body).to include('turbo-stream')
        expect(response.body).to include('banks')
        expect(response.body).to include('bank_form')

        expect(response.body).to include('prepend', 'bank')
        expect(response.body).to include('replace', 'bank_form')
      end

      it 'renders the error message when name is too short' do
        post banks_path, params: { bank: { name: 'a', account: bank_params[:account]  } }

        expect(response.body).to include('error_message','Nombre del Banco es demasiado corto')
      end

      it 'renders the error message when account number is  not 15 digits' do
        post banks_path, params: { bank: { name: bank_params[:name], account: '123' } }

        expect(response.body).to include('error_message','Numero de Cuenta son 15 digitos')
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
      let(:bank) { create(:bank) }
      before do
        sign_in user
      end

      context 'with valid params' do
        it 'updates the bank' do
          old_title = bank.name

          patch bank_path(bank), params: { bank: { name: 'Updated Title' } }
          expect(bank.reload.name).to eq('Updated Title')
          expect(bank.reload.name).not_to eq(old_title)
        end
      end

      context 'with invalid params' do
        it 'renders the error message' do
          put bank_path(bank), params: { bank: { name: '' } }

          expect(response.body).to include('error_message')
          expect(response.body).to include('Nombre del Banco no puede estar vacío and Nombre del Banco es demasiado corto')
        end
      end
    end
  end

  describe 'DELETE /banks/:id' do
    context 'when user is authenticated' do
      let!(:bank) { create(:bank) }
      before do
        sign_in user
      end
      it 'returns a successful response and deletes the bank' do
        expect {
          delete bank_path(bank)
        }.to change(Bank, :count).by(-1)
        expect(response).to be_successful
      end
    end
  end

end

