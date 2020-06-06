# frozen_string_literal: true

module NamespaceHelper
  def document_tree_for(namespace)
    Document.arrange(namespace: namespace)
  end

  def document_tree_list_for(namespace)
    list_from_document_tree(document_tree_for(namespace))
  end

  def list_from_document_tree(node, root = true)
    ul_options = {}
    ul_options[:class] = 'ml-4' unless root

    content_tag(:ul, ul_options) do
      safe_join(
        node.collect do |parent, children|
          content_tag(:li) do
            list_content = []
            list_content << content_tag(:a, parent.title, href: namespace_doc_path(parent.namespace, parent))
            list_content << list_from_document_tree(children, false) if children.any?

            safe_join(list_content)
          end
        end
      )
    end
  end

  def document_tree_options_array_for(namespace)
    options = []

    options_from_document_tree(document_tree_for(namespace), options)

    options
  end

  def options_from_document_tree(node, options)
    node.each do |parent, children|
      option_text = '-' * parent.depth + " #{parent.title}"

      options << [option_text, parent.id]

      options_from_document_tree(children, options)
    end
  end
end
