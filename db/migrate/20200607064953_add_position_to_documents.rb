# frozen_string_literal: true

class AddPositionToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :position, :integer, null: false, default: 1
  end
end
