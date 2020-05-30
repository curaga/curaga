# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :documents, foreign_key: :owner_id, inverse_of: :owner, dependent: :destroy
  has_many :memberships, class_name: 'NamespaceMembership', dependent: :destroy
  has_many :namespaces, through: :memberships

  def default_namespace
    Users::DefaultNamespaceFinderService.new(self).execute
  end

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
