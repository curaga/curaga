class AddNamespaceToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_reference :documents, :namespaces, null: false, foreign_key: true
  end
end
