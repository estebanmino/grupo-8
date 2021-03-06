class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.date :date
      t.time :time
      t.text :place
      t.text :address
      t.text :commune
      t.float :latitude
      t.float :longitude
      t.integer :visitor_goals
      t.integer :local_goals
      t.boolean :played

      t.timestamps
    end
  end
end
