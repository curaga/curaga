# frozen_string_literal: true

module Namespaceable
  extend ActiveSupport::Concern

  included do
    before_action :namespace
    before_action :docs

    layout 'namespace'
  end

  private

  def namespace
    @namespace = Namespace.friendly.find(params[:slug][1..])
  end

  def docs
    @docs = @namespace.documents.order(updated_at: :desc)
  end
end
