class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers, id: :uuid do |t|
      t.string :name, null: false
      t.string :nit, null: false
      t.string :contact_name, null: false
      t.string :phone, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :bank, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
