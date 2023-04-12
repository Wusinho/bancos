class AddProviderReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :banks, :provider, foreign_key: true, type: :uuid
  end
end
