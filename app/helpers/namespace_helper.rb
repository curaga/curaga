# frozen_string_literal: true

module NamespaceHelper
  def document_tree_for(namespace)
    Document.arrange(namespace: namespace, order: :position)
  end

  def document_tree_list_for(namespace)
    list_from_document_tree(document_tree_for(namespace), namespace)
  end

  def list_from_document_tree(node, namespace, root = true)
    ul_options = {}
    ul_options[:class] = 'ml-4' unless root

    content_tag(:ul, ul_options) do
      safe_join(
        node.collect do |parent, children|
          content_tag(:li) do
            list_content = []

            document_href = if controller_name == 'root'
                              root_doc_path(parent.slug)
                            else
                              namespace_doc_path(namespace, parent.slug)
                            end

            list_content << content_tag(:a, parent.title, href: document_href)
            list_content << list_from_document_tree(children, namespace, false) if children.any?

            safe_join(list_content)
          end
        end
      )
    end
  end

  def document_tree_options_array_for(namespace, current_doc = nil, params = {})
    options = []

    options_from_document_tree(document_tree_for(namespace), current_doc, options)

    if params[:include_blank]
      blank_text = params[:include_blank].is_a?(String) ? params[:include_blank] : '<No Parent>'

      options.unshift([blank_text, ''])
    end

    options
  end

  def options_from_document_tree(node, current_doc, options)
    node.each do |parent, children|
      next if parent == current_doc

      option_text = '-' * parent.depth + " #{parent.title}"

      options << [option_text, parent.id]

      options_from_document_tree(children, current_doc, options)
    end
  end
end
