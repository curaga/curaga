# frozen_string_literal: true

class NamespacesController < ApplicationController
  include Namespaceable
  include Pundit

  def show
    return redirect_to root_url if @namespace.id.to_s == ENV.fetch('DEFAULT_NAMESPACE_ID')

    if @document = @namespace.default_doc
      render 'namespaces/docs/show'
    else
      redirect_to namespace_doc_path(@namespace, @namespace.documents.order(Arel.sql('RANDOM()')).first.slug)
    end
  end
end
