require_relative 'dom_tree'

class NodeRenderer

  def initialize(tree)
    @tree = tree.root

  end

  def render(node = nil)
    #outputs how many nodes there are in the subtree below this node
    #a count of each node type in the subtree
    #all of the node's data attributes
    node ||= @tree 
    
    puts "Class: #{node.class}"
    puts "ID: #{node.id}"
    puts "#{count_children(node)} direct children"
    puts "#{count_all_descendents(node)} total descendents"

    

  end

  def count_all_descendents(node)
     node ||= tree.root

     return 0 if node.children.size == 0
     #credit to solution repo
     node.children.inject(count_children(node)) do |amount, child_node|
       self.count_all_descendents(child_node) + amount
     end
  end

  def count_children(node)
    node.children.count
  end
  

end

n = NodeRenderer.new(DOMTree.new)
n.render