class AddReferenceToRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :requests, :solicitante, foreign_key: { to_table: "users" }
  end
end
