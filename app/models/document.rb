# frozen_string_literal: true

class Document < ApplicationRecord
  has_ancestry orphan_strategy: :adopt

  belongs_to :namespace
  belongs_to :owner, class_name: 'User'
end
