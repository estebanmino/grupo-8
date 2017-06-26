class AddUserToComment < ActiveRecord::Migration[5.0]
  def change
  end
  add_reference :comments, :user, foreign_key: true
end
