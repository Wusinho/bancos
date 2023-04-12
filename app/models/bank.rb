class Bank < ApplicationRecord
  belongs_to :user
  validates :name, presence: true , uniqueness: true, length: {minimum: 3, maximum: 50}
  validates :account, presence: true , uniqueness: true, length: { is: 15}
end
