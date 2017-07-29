class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :content
      t.integer :unique_code
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
