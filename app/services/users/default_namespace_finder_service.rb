# frozen_string_literal: true

module Users
  class DefaultNamespaceFinderService
    def initialize(user)
      @user = user
    end

    def execute
      Namespace
        .joins(:memberships)
        .find_by('namespace_memberships.default': true, 'namespace_memberships.user_id': @user.id)
    end
  end
end
