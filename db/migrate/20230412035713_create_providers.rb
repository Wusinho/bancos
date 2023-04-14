class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers, id: :uuid do |t|
      t.string :name
      t.string :nit
      t.string :contact_name
      t.string :phone
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
