class AddDivisionRefToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :division, foreign_key: true
  end
end
