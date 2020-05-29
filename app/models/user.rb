# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :memberships, class_name: 'NamespaceMembership'
  has_many :namespaces, through: :memberships

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
