class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :season, null: false

      t.timestamps
    end
  end
end
