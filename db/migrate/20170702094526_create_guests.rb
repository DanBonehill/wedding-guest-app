class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.string :rsvp
      t.integer :unique_code

      t.timestamps
    end
  end
end
