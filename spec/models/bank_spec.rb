require 'rails_helper'

RSpec.describe Bank, type: :model do
  describe Bank do
    context 'Bank associations' do
      it do
        should belong_to(:provider)
      end
    end
    context 'validations' do
      it { should validate_presence_of(:name) }
      it { should validate_length_of(:name).is_at_least(3).is_at_most(50) }
      it { should validate_length_of(:account).equal?(15) }
    end
  end
end
