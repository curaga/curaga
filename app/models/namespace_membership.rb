# frozen_string_literal: true

class NamespaceMembership < ApplicationRecord
  belongs_to :user
  belongs_to :namespace
end
