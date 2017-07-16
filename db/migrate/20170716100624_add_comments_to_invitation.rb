class AddCommentsToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :comments, :string
  end
end
