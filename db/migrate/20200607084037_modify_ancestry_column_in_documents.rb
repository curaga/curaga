# frozen_string_literal: true

class ModifyAncestryColumnInDocuments < ActiveRecord::Migration[6.0]
  def up
    change_column_default :documents, :ancestry, nil
    change_column_null :documents, :ancestry, true
  end

  def down
    change_column_default :documents, :ancestry, ''
    change_column_null :documents, :ancestry, false
  end
end
