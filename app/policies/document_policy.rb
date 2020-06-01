# frozen_string_literal: true

class DocumentPolicy < ApplicationPolicy
  def update?
    @user == @record.owner
  end
end
