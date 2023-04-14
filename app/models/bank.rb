class Bank < ApplicationRecord
  belongs_to :provider
  validates :name, presence: true , length: {minimum: 3, maximum: 50}
  validates :account, uniqueness: true, length: { is: 15 }, if: -> { account.present? }

  after_create_commit { broadcast_prepend_to "user_#{self.provider.user.id}" }
  after_update_commit { broadcast_replace_to "user_#{self.provider.user.id}" }

  def provider_select(current_user)
    current_user.providers.collect {|p| [ p.name, p.id ] }
  end

end
