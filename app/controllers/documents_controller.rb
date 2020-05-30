class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]

  def new
    @document = Document.new
  end

  def create
    @document = current_user.documents.new(document_params)
    @document.namespace = current_user.default_namespace

    if @document.save
      redirect_to document_url(@document)
    else
      render action: :new
    end
  end

  def show; end

  def edit; end

  def update
    if @document.update(document_params)
      redirect_to document_url(@document)
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
    params.require(:document).permit(:title, :content)
  end

  def set_document
    @document = Document.find(params[:id])
  end
end
