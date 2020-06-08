# frozen_string_literal: true

class AddSlugToDocuments < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_column :documents, :slug, :string, null: false
    # rubocop:enable Rails/NotNullColumn
    add_index :documents, [:slug, :namespace_id], unique: true
  end
end
