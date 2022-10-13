class CreateTurnos < ActiveRecord::Migration[6.0]
  def change
    create_table :turnos do |t|
      t.string :nombre_completo#
      t.string :comuna#
      t.string :direccion_salida#
      t.date :dia_semana
      t.time :hora_salida#
      t.integer :limite_personas#
      t.string :direccion#
      t.text :descripcion#
      t.string :tipo #

      t.timestamps
    end
  end
end
