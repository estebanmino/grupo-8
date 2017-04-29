class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.integer :goals, null: false
      t.integer :yellow_cards, null: false
      t.integer :red_cards, null: false
      t.timestamps
    end
  end
end
