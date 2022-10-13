class AddDireccionToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :direccion, :string
  end
end
