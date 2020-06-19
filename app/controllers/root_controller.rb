# frozen_string_literal: true

class RootController < ApplicationController
  include Namespaceable
  include Pundit

  def index
    if @document = @namespace.default_doc
      render 'namespaces/docs/show'
    else
      redirect_to root_doc_path(@namespace.documents.order(Arel.sql('RANDOM()')).first.slug)
    end
  end

  def show
    @document = @namespace.documents.friendly.find(params[:id])

    return redirect_to root_url if @namespace.default_doc_id == @document.id

    render 'namespaces/docs/show'
  end

  private

  def namespace
    @namespace = Namespace.find(ENV.fetch('DEFAULT_NAMESPACE_ID'))
  end
end
