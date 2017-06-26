class AddTournamentToDivision < ActiveRecord::Migration[5.0]
  def change
    add_reference :divisions, :tournament, foreign_key: true
  end
end
