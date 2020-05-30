class Document < ApplicationRecord
  belongs_to :namespace
  belongs_to :owner, class_name: 'User'
end
