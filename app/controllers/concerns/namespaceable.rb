# frozen_string_literal: true

module Namespaceable
  extend ActiveSupport::Concern

  included do
    before_action :namespace
  end

  private

  def namespace
    @namespace = Namespace.friendly.find(params[:slug][1..])
  end
end
