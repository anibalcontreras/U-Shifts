class DropMensajes < ActiveRecord::Migration[6.0]
  def change
    drop_table :mensajes
  end
end
