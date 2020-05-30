# frozen_string_literal: true

module Namespaces
  class DocsController < ::ApplicationController
    before_action :namespace

    def show
      @document = @namespace.documents.find(params[:id])
    end

    private

    def namespace
      @namespace = Namespace.friendly.find(params[:slug])
    end
  end
end
