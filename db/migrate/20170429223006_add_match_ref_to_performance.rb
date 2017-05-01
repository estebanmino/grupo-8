class AddMatchRefToPerformance < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :match, foreign_key: true
  end
end
