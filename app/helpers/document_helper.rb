# frozen_string_literal: true

module DocumentHelper
  def path_for_document(document)
    # Using @namespace avoids an additional database query/object load
    # rubocop:disable Rails/HelperInstanceVariable
    namespace = @namespace || document.namespace
    # rubocop:enable Rails/HelperInstanceVariable
    path_helper_prefix = controller_name == 'root' ? 'root' : 'namespace'
    args = []

    # Set up namespace argument if doc is accessed from a namespace
    args << namespace if path_helper_prefix == 'namespace'

    # Set up path method and arguments for non-default doc
    unless namespace.default_doc_id == document.id
      args << document.slug
      path_helper_prefix += '_doc'
    end

    send("#{path_helper_prefix}_path", *args)
  end
end
