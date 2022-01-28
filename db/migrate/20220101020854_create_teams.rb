class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.text :remarks
      t.integer :chief, null: false

      t.timestamps
    end
  end
end
