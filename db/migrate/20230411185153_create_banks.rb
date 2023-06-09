class CreateBanks < ActiveRecord::Migration[7.0]
  def change
    create_table :banks, id: :uuid do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
