class AddDatenumToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :datenum, :integer
  end
end
