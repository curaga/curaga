class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :recoverable, :registerable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :validatable

  has_many :namespaces

  before_create :build_default_namespace

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  private

  def build_default_namespace
    namespaces.build(slug: username)
  end
end
