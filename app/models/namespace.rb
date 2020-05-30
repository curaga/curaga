# frozen_string_literal: true

class Namespace < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :documents, dependent: :destroy
  has_many :memberships, class_name: 'NamespaceMembership', dependent: :destroy
  has_many :users, through: :memberships
end
