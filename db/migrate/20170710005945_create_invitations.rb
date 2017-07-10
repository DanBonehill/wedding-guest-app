class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :rsvp
      t.integer :unique_code
      t.string :email

      t.timestamps
    end
  end
end