# frozen_string_literal: true

class Namespace < ApplicationRecord
  extend FriendlyId
  friendly_id :slug, use: :slugged

  has_many :documents, dependent: :destroy
  has_many :memberships, class_name: 'NamespaceMembership', dependent: :destroy
  has_many :users, through: :memberships

  def to_param
    "@#{slug}"
  end
end
