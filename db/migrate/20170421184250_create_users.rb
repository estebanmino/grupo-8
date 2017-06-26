class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.string :position, null: false
      t.integer :goals, null: false
      t.integer :yellow_cards, null: false
      t.integer :red_cards, null: false
      t.boolean :is_admin, null: false, default: false
      t.boolean :is_captain, null: false, default: false

      t.timestamps
    end
  end
end
