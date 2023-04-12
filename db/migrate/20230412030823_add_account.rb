class AddAccount < ActiveRecord::Migration[7.0]
  def change
    add_column :banks, :account, :string, null: false

  end
end
