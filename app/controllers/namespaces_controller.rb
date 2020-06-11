# frozen_string_literal: true

class NamespacesController < ApplicationController
  include Namespaceable

  def show
    if @namespace.default_doc
      redirect_to namespace_doc_path(@namespace, @namespace.default_doc.slug)
    else
      redirect_to namespace_doc_path(@namespace, @namespace.documents.order(Arel.sql('RANDOM()')).first.slug)
    end
  end
end
