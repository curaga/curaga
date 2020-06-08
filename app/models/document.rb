# frozen_string_literal: true

class Document < ApplicationRecord
  extend FriendlyId
  friendly_id :generate_slug, use: :scoped, scope: :namespace

  acts_as_list scope: [:namespace_id, :ancestry]
  has_ancestry orphan_strategy: :adopt

  belongs_to :namespace
  belongs_to :owner, class_name: 'User'

  def generate_slug
    slugified_title = title.parameterize
    slugified_title.prepend("#{parent.slug}/") if parent.present?
    slugified_title
  end

  def normalize_friendly_id(string)
    string
  end

  def to_param
    id.to_s
  end
end
