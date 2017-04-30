class AddTournamentRefToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :tournament, foreign_key: true
  end
end
