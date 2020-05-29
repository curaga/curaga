# frozen_string_literal: true

module Users
  class CreateService
    def initialize(user_params)
      @user_params = user_params
    end

    def execute
      ActiveRecord::Base.transaction do
        user = User.create(@user_params)
        namespace = Namespace.create(slug: user.username)
        NamespaceMembership.create(user: user, namespace: namespace, default: true)
      end

      user
    end
  end
end
