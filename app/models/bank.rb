class Bank < ApplicationRecord
  belongs_to :provider, dependent: :destroy
  validates :name, presence: true , length: {minimum: 3, maximum: 50}
  validates :account, uniqueness: true, length: { is: 15 }
end
