class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :contenido
      t.datetime :hora
      t.references :chat, null: false, foreign_key: true
      t.references :sender, foreign_key: { to_table: "users" }

      t.timestamps
    end
  end
end
