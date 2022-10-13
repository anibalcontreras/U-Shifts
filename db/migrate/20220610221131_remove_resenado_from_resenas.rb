class RemoveResenadoFromResenas < ActiveRecord::Migration[6.0]
  def change
    remove_column :resenas, :resenado, :string
  end
end
