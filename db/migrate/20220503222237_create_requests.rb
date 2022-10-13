class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
