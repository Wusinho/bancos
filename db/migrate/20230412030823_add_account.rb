class AddAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :banks, :account, :string, null: false
    remove_reference :banks, :user, foreign_key: true, type: :uuid
  end
end
