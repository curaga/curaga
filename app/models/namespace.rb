class Namespace < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :documents
end
