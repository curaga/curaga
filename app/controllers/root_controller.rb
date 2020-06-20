# frozen_string_literal: true

class RootController < ApplicationController
  include Namespaceable

  def index
    return render_doc_template if (@document = @namespace.default_doc)

    redirect_to root_doc_path(@namespace.documents.order(Arel.sql('RANDOM()')).first.slug)
  end

  def show
    @document = @namespace.documents.friendly.find(params[:id])

    return redirect_to root_url if @namespace.default_doc_id == @document.id

    render_doc_template
  end

  private

  def namespace
    @namespace = Namespace.find(ENV['DEFAULT_NAMESPACE_ID'])
  end

  def render_doc_template
    render 'namespaces/docs/show'
  end
end
