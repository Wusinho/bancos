class Bank < ApplicationRecord
  belongs_to :user
  validate :name, presence: true , uniqueness: true
end
