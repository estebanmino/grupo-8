class AddMatchToPicture < ActiveRecord::Migration[5.0]
  def change
    add_reference :pictures, :match, foreign_key: true
  end
end
