# frozen_string_literal: true

module Internal
  module Namespaces
    class SettingsController < BaseController
      before_action :namespace, except: :index

      def show
      end

      def update
      end

      private

      def namespace
        @namespace = current_user.namespaces.friendly.find(params[:namespace_id][1..])
      end
    end
  end
end
