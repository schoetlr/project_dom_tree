require_relative 'dom_tree'


class TreeSearcher

  def initialize(tree = DOMTree.new.root)
    @tree = tree
  end

  def search_by(attribute, search_term)
    case attribute
    when :name
      search_by_name(search_term)
    when :class
      search_by_class
    when :id
      search_by_id
    end

  end

  #search all descendents of a node
  def search_children(node, attribute, search_term)
    matches = []
  end


  def search_ancestors(node, attribute, search_term)

  end

  def search_by_name(term)
    matches = []

    @tree.children.each do |child|
      matches << child if child.name == term

  end

  def search_by_class(term)

  end

  def search_by_id(term)

  end


end