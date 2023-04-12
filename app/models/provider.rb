class Provider < ApplicationRecord
  belongs_to :user
  has_many :banks
  validates_presence_of :name
  validates_presence_of :contact_name
  validates :nit, presence: true, length: { minimum: 9, maximum: 10 }
  validates :phone, length: { minimum: 9, maximum: 10 }
end
