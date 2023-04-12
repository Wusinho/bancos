class Provider < ApplicationRecord
  belongs_to :user
  has_many :banks
  validates :name, presence: true
  validates_presence_of :contact_name
  validates :nit, presence: true, length: { minimum: 9, maximum: 11 },
            format: { with: /\A\d{9}-?\d?\z/, message: "must have correct format" }
  validates :phone, length: { minimum: 9, maximum: 10 }, if: -> { phone.present? }
  accepts_nested_attributes_for :banks, allow_destroy: true
end
