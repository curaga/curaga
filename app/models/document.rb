# frozen_string_literal: true

class Document < ApplicationRecord
  extend FriendlyId
  friendly_id :generate_slug, use: :scoped, scope: :namespace

  acts_as_list scope: [:namespace_id, :ancestry]
  has_ancestry orphan_strategy: :adopt

  belongs_to :namespace
  belongs_to :owner, class_name: 'User'

  def editable_slug
    @editable_slug || slug&.split('/')&.last
  end

  def editable_slug=(value)
    attribute_will_change!('editable_slug') if editable_slug != value
    @editable_slug = value
  end

  def editable_slug_changed?
    changed.include?('editable_slug')
  end

  def generate_slug
    slugified_title = (editable_slug.presence || title).parameterize
    slugified_title.prepend("#{parent.slug}/") if parent.present?
    slugified_title
  end

  def normalize_friendly_id(string)
    string
  end

  def should_generate_new_friendly_id?
    editable_slug.blank? || super
  end

  def to_param
    id.to_s
  end
end
