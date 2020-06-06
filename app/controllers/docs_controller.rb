# frozen_string_literal: true

class DocsController < ApplicationController
  before_action :document, only: [:edit, :update, :destroy]

  def index
    @docs = current_user.default_namespace.documents
  end

  def new
    @document = Document.new
  end

  def create
    @document = current_user.documents.new(document_params)
    @document.namespace = current_user.default_namespace

    if @document.save
      redirect_to documents_url
    else
      render action: :new
    end
  end

  def edit; end

  def update
    if @document.update(document_params)
      redirect_to documents_url
    else
      render action: :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url
  end

  private

  def document_params
    params.require(:document).permit(:title, :content, :parent_id)
  end

  def document
    @document = current_user.documents.find(params[:id])
  end
end
