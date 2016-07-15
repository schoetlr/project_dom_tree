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



Node = Struct.new(:open, 
                  :close)

class DOMReader

  def initialize
    @html_nodes = {}
    @dom_string = serialize_dom("test.html")
    @root = Node.new("html", nil, nil, [])
  end

  ATTRS = %w{ open close }
  REGEXS = [/(<\w+.*?>)/,
            /(<\/\w+>)/]

  ATTRS.each_index do |i|
    define_method("parse_#{ATTRS[i]}") do |string|
      REGEXS[i].match(string)
      $1
    end
  end

  def serialize_dom(file_name)
    text = File.read(file_name)
  end

  def make_html_node(string)
    attributes = []
    ATTRS.each do |attrib|
      attributes << send("parse_#{attrib}".to_sym,string)
    end
    Node.new(*attributes)
  end


  def build_tree
    html_tags = parse_tag(@dom_string)
    text_nodes = @dom_string.scan(/>(\s*.+\s*)</)
    puts "///TAGS///"
    html_tags.each do |tag|
      p tag
    end
    puts
    puts "///TEXT///"
    text_nodes.each do |txt|
      p txt
    end
  end


end

DOMReader.new.build_tree