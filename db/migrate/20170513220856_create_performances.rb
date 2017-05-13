class CreatePerformances < ActiveRecord::Migration[5.0]
  def change
    create_table :performances do |t|
      t.belongs_to :user, index: true
      t.belongs_to :match, index: true
      t.integer :goals, null: false
      t.integer :yellow_cards, null: false
      t.integer :red_cards, null: false
      t.timestamps
    end
  end
end
