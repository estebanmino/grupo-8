class AddTeamRefToMatches < ActiveRecord::Migration[5.0]
  def change

    add_reference :matches, :visit_team, index: true, foreign_key: { to_table: :teams }
    add_reference :matches, :home_team, index: true, foreign_key: { to_table: :teams }
  end
end
