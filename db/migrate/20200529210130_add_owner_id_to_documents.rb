# frozen_string_literal: true

class AddOwnerIdToDocuments < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_column :documents, :owner_id, :bigint, null: false
    # rubocop:enable Rails/NotNullColumn
    add_foreign_key :documents, :users, column: :owner_id
  end
end
