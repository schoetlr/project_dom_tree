#Pseudocode for dom_reader

#Node will have have children attribute which is an array, and a parent attribute
#Each child is a node and will have children themselves
#Node's children are in order

#plain text is also a node



# HTML_STRING = 
# "<div>
#   div text before
#   <p>
#     p text
#   </p>
#   <div>
#     more div text
#   </div>
#   div text after
# </div>"


# def split_on_tag(string)
#   string.split(/\<\/*[\w\s]+\>/)
# end

# p split_on_tag(HTML_STRING)



Node = Struct.new(:name,
                  :class,
                  :id,
                  :open,
                  :close,
                  :children, 
                  :parent)

class DOMTree
  attr_reader :root
  def initialize
    @html_nodes = {}
    @dom_lines = serialize_dom
    @root = Node.new("doctype", nil, nil, true, false, [], nil)
    @tree = build_tree
  end


  def serialize_dom(file_name = "test.html")
    text = File.readlines(file_name).map(&:strip)               
  end


  def build_tree
    #html_tags = @dom_string.scan(/<\/*\w+>/)
    #text_nodes = @dom_string.scan(/>\s*.+\s*</)
    current_node = @root
    
    @dom_lines.each do |line|
      if line[0..1] == '</'
        closing_node_name = line.gsub(/\W/, "")
        node = Node.new(closing_node_name, nil, nil, false, true, [], current_node)

        current_node.children << node
        #current_node = node.parent,  unneccessary just do not update the current_node
      elsif line[0] == '<'
        html_node_info = parse_tag(line)
        node = Node.new(html_node_info[:type], html_node_info[:class], html_node_info[:id], true, false, [], current_node)

        current_node.children << node
        current_node = node   
      elsif line[0].match(/[^<]/)
        node = Node.new(line, nil, nil, false, false, [], current_node)

        current_node.children << node
        #current_node = node.parent,  unneccessary just do not update the current_node
      end   

      
    end
    @root
  end

  def parse_tag(string)
    tag = {}


    /<(\w+)>/.match(string)
    tag[:type] = $1

    if /class=['"]([\w\s\-]+)['"]/.match(string)
      tag[:class] = $1.split(' ')
    end

    if
      /id=['"]([\w\s\-]+)['"]/.match(string)
      tag[:id] = $1
    end

    if 
      /name=['"]([\w\s\-]+)['"]/.match(string)
      tag[:name] = $1
    end

    tag
  end




end

