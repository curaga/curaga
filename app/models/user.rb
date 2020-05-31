# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :documents, foreign_key: :owner_id, inverse_of: :owner, dependent: :destroy
  has_many :memberships, class_name: 'NamespaceMembership', dependent: :destroy
  has_many :namespaces, through: :memberships

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :username, format: { with: /\A[a-zA-Z0-9_]*\z/, message: 'only allows alphanumeric characters and underscores' },
                       presence: true,
                       uniqueness: { case_sensitive: false }

  def default_namespace
    Users::DefaultNamespaceFinderService.new(self).execute
  end

  ####
  # Devise methods
  ####

  # Remember user by default (:rememberable)
  def remember_me
    true
  end
end
