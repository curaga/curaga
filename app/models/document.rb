# frozen_string_literal: true

class Document < ApplicationRecord
  belongs_to :namespace
  belongs_to :owner, class_name: 'User'
end
