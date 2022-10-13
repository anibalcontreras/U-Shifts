class AddReferencesToMembers < ActiveRecord::Migration[6.0]
  def change
    add_reference :members, :turno, null: false, foreign_key: true
    add_reference :members, :user, null: false, foreign_key: true
  end
end
