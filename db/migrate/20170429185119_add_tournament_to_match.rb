class AddTournamentToMatch < ActiveRecord::Migration[5.0]
  def change
    add_reference :matches, :tournament, foreign_key: true
  end
end
