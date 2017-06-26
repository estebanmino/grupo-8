class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.string :email
      t.integer :team_id
      t.integer :sender_id
      t.string :token
      t.boolean :is_captain

      t.timestamps
    end
  end
end
