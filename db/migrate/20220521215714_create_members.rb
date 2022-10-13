class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :username
      t.integer :turno_id

      t.timestamps
    end
  end
end
