require 'rails_helper'

RSpec.describe Bank, type: :model do
  describe Bank do
    context 'Bank associations' do
      it do
        should belong_to(:user)
      end
    end
    context 'validations' do
      it do
        should validate_presence_of(:name)
      end
    end
  end
end
