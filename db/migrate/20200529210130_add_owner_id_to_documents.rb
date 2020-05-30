class AddOwnerIdToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :owner_id, :bigint, null: false
    add_foreign_key :documents, :users, column: :owner_id
  end
end
