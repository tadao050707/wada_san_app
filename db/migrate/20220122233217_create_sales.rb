class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.bigint :code
      t.date :date_at
      t.integer :inputter
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
