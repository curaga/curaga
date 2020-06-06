# frozen_string_literal: true

class AddAncestryToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :ancestry, :string, null: false, default: ''
    add_index :documents, :ancestry
  end
end
