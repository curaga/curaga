# frozen_string_literal: true

class AddTitleToNamespaces < ActiveRecord::Migration[6.0]
  def change
    add_column :namespaces, :title, :text
  end
end
