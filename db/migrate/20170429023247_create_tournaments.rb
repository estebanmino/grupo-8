class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :description
      t.string :season

      t.timestamps
    end
  end
end
