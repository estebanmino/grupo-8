class AddPlayoffToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :playoff, :boolean, default: false
  end
end
