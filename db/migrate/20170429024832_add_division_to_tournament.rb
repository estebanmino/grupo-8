class AddDivisionToTournament < ActiveRecord::Migration[5.0]
  def change
    add_reference :tournaments, :division, foreign_key: true
  end
end
