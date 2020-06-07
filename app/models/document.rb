# frozen_string_literal: true

class Document < ApplicationRecord
  acts_as_list scope: [:namespace_id, :ancestry]
  has_ancestry orphan_strategy: :adopt

  belongs_to :namespace
  belongs_to :owner, class_name: 'User'
end
