class AddDatenumToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :Datenum, :integer
  end
end
