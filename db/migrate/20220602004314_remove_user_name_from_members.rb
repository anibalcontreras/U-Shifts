class RemoveUserNameFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :username, :string
  end
end
