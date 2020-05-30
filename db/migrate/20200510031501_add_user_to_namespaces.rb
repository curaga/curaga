# frozen_string_literal: true

class AddUserToNamespaces < ActiveRecord::Migration[6.0]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_reference :namespaces, :user, null: false, foreign_key: true
    # rubocop:enable Rails/NotNullColumn
  end
end
