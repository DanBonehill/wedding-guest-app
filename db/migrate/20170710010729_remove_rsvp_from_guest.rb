class RemoveRsvpFromGuest < ActiveRecord::Migration[5.1]
  def change
    remove_columns :guests, :rsvp, :email, :unique_code
  end
end
