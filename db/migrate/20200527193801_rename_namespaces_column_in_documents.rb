class RenameNamespacesColumnInDocuments < ActiveRecord::Migration[6.0]
  def change
    rename_column :documents, :namespaces_id, :namespace_id
  end
end
