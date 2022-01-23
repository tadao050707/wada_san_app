class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.bigint :code, null: false
      t.date :date_at, null: false
      t.integer :inputter, null: false
      t.references :client, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
