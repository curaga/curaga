# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.text :title, null: false, default: ''
      t.jsonb :content, null: false, default: '{"doc": {"type":"doc"}}'

      t.timestamps
    end
  end
end
