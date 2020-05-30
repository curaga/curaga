# frozen_string_literal: true

class NamespacesController < ApplicationController
  def show
    @namespace = Namespace.friendly.find(params[:slug])
    @docs = @namespace.documents.order(updated_at: :desc)
  end
end
