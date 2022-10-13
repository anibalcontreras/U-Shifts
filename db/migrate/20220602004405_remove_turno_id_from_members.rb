class RemoveTurnoIdFromMembers < ActiveRecord::Migration[6.0]
  def change
    remove_column :members, :turno_id, :integer
  end
end
