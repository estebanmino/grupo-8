class AddUserRefToPerformance < ActiveRecord::Migration[5.0]
  def change
    add_reference :performances, :user, foreign_key: true
  end
end
