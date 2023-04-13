class Bank < ApplicationRecord
  belongs_to :provider
  validates :name, presence: true , length: {minimum: 3, maximum: 50}
  validates :account, uniqueness: true, length: { is: 15 }, if: -> { account.present? }

  def provider_select(current_user)
    current_user.providers.collect {|p| [ p.name, p.id ] }
  end

end
