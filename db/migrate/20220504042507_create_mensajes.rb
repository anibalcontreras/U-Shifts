class CreateMensajes < ActiveRecord::Migration[6.0]
  def change
    create_table :mensajes do |t|
      t.text :descripcion
      t.belongs_to :turno, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
