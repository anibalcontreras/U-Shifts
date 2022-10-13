class AddUserIdToTurnos < ActiveRecord::Migration[6.0]
  def change
    add_column :turnos, :user_id, :integer
    add_index :turnos, :user_id
  end
end
