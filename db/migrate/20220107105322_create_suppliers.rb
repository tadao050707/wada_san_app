class CreateSuppliers < ActiveRecord::Migration[6.1]
  def change
    create_table :suppliers do |t|
      t.bigint :code, null: false
      t.string :name, null: false
      t.string :phone_number
      t.string :fax_number
      t.string :address
      t.text :remarks

      t.timestamps
    end
    add_index :suppliers, [:code], unique: true
  end
end
