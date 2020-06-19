# frozen_string_literal: true

module Internal
  module Namespaces
    class SettingsController < BaseController
      def show; end

      def update
        if @namespace.update(namespace_params)
          redirect_to internal_namespace_settings_url(@namespace)
        else
          render :show
        end
      end

      private

      def namespace_params
        params.require(:namespace).permit(:default_doc_id, :title)
      end
    end
  end
end
