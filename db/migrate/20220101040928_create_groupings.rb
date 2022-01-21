class CreateGroupings < ActiveRecord::Migration[6.1]
  def change
    create_table :groupings do |t|
      t.references :team, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :groupings, [:user_id, :team_id], unique: true
  end
end
