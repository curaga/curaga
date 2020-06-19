# frozen_string_literal: true

module ApplicationHelper
  # rubocop:disable Rails/HelperInstanceVariable
  def page_title(*titles)
    @page_title ||= []

    @page_title.push(*titles.compact) if titles.any?

    @page_title.join(' · ')
  end
  # rubocop:enable Rails/HelperInstanceVariable
end
