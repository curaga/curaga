# frozen_string_literal: true

class Namespace < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :documents
  has_many :memberships, class_name: 'NamespaceMembership'
  has_many :users, through: :memberships
end
