class CreateResenas < ActiveRecord::Migration[6.0]
  def change
    create_table :resenas do |t|
      t.string :resenador
      t.string :resenado
      t.integer :valoracion
      t.text :descripcion

      t.timestamps
    end
  end
end
