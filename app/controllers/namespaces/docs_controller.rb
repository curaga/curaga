# frozen_string_literal: true

module Namespaces
  class DocsController < ::ApplicationController
    include Namespaceable
    include Pundit

    def show
      @document = @namespace.documents.friendly.find(params[:id])
    end
  end
end
