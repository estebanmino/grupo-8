class AddFavorToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :gf, :integer, default:  0
    add_column :teams, :ga, :integer, default:  0
  end
end
