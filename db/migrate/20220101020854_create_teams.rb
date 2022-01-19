class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.text :remarks
      t.boolean :chief, null: false, default: false

      t.timestamps
    end
  end
end
