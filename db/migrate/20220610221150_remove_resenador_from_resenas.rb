class RemoveResenadorFromResenas < ActiveRecord::Migration[6.0]
  def change
    remove_column :resenas, :resenador, :string
  end
end
