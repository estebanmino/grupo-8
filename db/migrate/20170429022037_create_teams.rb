class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points
      t.integer :won
      t.integer :lost
      t.integer :tie

      t.timestamps
    end
  end
end
