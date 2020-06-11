# frozen_string_literal: true

class AddDefaultDocToNamespace < ActiveRecord::Migration[6.0]
  def change
    add_column :namespaces, :default_doc_id, :bigint
    add_foreign_key :namespaces, :documents, column: :default_doc_id
  end
end
