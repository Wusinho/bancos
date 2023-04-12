class Provider < ApplicationRecord
  belongs_to :user
  belongs_to :bank
  validates_presence_of :name
  validates_presence_of :contact_name
  validate :nit, presence: true, length: { minimum: 9, maximum: 10 }
  validate :phone, length: { minimum: 9, maximum: 10 }
end
