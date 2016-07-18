require_relative 'dom_tree'

class PageBuilder

  def initialize(tree = DOMTree.new.root)
    @tree = tree
  end

  def build_html_page
    current_node = @tree
    File.open("new_page.html", "w") do |f|
      f.write(write_node(current_node))
      loop do 
        break if current_node.children.empty?
       
        current_node.children.each do |node|
          f.write write_node(node)
        end
        
        current_node = current_node.children[-1]
      end
    end
    
  end

  def write_node(node)
    if node.close
      "</#{node.name}>\n"
    elsif node.open && node.class && node.id
      "<#{node.name} class='#{node.class}' id='#{node.id}'>\n"
    elsif node.open && node.class
      "<#{node.name} class='#{node.class}'>\n"
    elsif node.open && node.id
      "<#{node.name} id='#{node.id}'>\n"
    elsif node.open 
      "<#{node.name}>\n"
    else
      "#{node.name}\n"
    end

  end


end



PageBuilder.new.build_html_page