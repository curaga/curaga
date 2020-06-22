# frozen_string_literal: true

module Internal
  module Namespaces
    class DocsController < BaseController
      before_action :document, except: [:new, :create]

      def new
        @document = current_user.documents.new
        @document.namespace = current_user.default_namespace
      end

      def create
        @document = current_user.documents.new(document_params)
        @document.namespace = current_user.default_namespace

        if @document.save
          redirect_to namespace_doc_path(@namespace, @document.slug)
        else
          render action: :new
        end
      end

      def edit; end

      def update
        if @document.update(document_params)
          redirect_to namespace_doc_path(@namespace, @document.slug)
        else
          render action: :edit
        end
      end

      def destroy
        @document.destroy
        redirect_to namespace_path(@namespace)
      end

      private

      def document_params
        params.require(:document).permit(:title, :content, :parent_id, :position, :editable_slug)
      end

      def document
        @document = @namespace.documents.find(params[:id])
      end
    end
  end
end
