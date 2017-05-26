class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.integer :points,  default:  0
      t.integer :won, default:  0
      t.integer :lost, default:  0
      t.integer :tie, default:  0

      t.timestamps
    end
  end
end
