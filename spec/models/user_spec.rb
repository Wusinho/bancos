require 'rails_helper'

RSpec.describe User, type: :model do
    context 'validations' do
      it do
        should validate_presence_of(:email)
        should validate_presence_of(:password)
      end
  end
end
