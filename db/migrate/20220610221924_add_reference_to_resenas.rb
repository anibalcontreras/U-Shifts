class AddReferenceToResenas < ActiveRecord::Migration[6.0]
  def change
    add_reference :resenas, :turno, null: false, foreign_key: true
  end
end
