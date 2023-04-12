require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe Provider do
    context 'Provider associations' do
      it do
        should belong_to(:user)
      end
    end
    context 'validations' do
      it { should validate_presence_of(:nit) }
      it { should validate_length_of(:nit).is_at_least(9).is_at_most(10) }
      it { should validate_length_of(:phone).is_at_least(9).is_at_most(10) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:contact_name) }
    end
  end
end
