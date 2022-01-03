class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :code, null: false
      t.string :name, null: false
      t.text :remarks
      t.integer :regular_price
      t.numeric :selling_price
      t.numeric :cost_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, [:code], unique: true
  end
end
