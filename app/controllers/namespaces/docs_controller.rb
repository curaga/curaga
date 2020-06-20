# frozen_string_literal: true

module Namespaces
  class DocsController < ::ApplicationController
    include Namespaceable

    before_action :check_site_default_namespace

    def index
      return render('namespaces/docs/show') if (@document = @namespace.default_doc)

      redirect_to namespace_doc_path(@namespace, @namespace.documents.order(Arel.sql('RANDOM()')).first.slug)
    end

    def show
      @document = @namespace.documents.friendly.find(params[:id])

      return redirect_to namespace_url(@namespace) if @document.id == @namespace.default_doc_id
    end

    private

    def check_site_default_namespace
      return unless @namespace.id.to_s == ENV['DEFAULT_NAMESPACE_ID']

      case action_name
      when 'index'
        redirect_to root_url
      when 'show'
        redirect_to root_doc_url(params[:id])
      end
    end
  end
end
