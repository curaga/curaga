class NamespacesController < ApplicationController
  def show
    @namespace = Namespace.friendly.find(params[:id])
  end
end
