class AddInvitationIdToGuests < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :invitation_id, :integer
  end
end
