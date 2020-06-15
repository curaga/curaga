# frozen_string_literal: true

module Namespaces
  class DocsController < ::ApplicationController
    include Namespaceable
    include Pundit

    def show
      return redirect_to root_doc_url(params[:id]) if @namespace.id.to_s == ENV.fetch('DEFAULT_NAMESPACE_ID')

      @document = @namespace.documents.friendly.find(params[:id])
    end
  end
end
