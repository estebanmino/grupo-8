class AddPlayoffToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :playoff, :boolean, default:  false
  end

end
