module Internal
  module Namespaces
    class BaseController < ::Internal::BaseController
      before_action :namespace

      private

      def namespace
        @namespace = current_user.namespaces.friendly.find(params[:namespace_id][1..])
      end
    end
  end
end
