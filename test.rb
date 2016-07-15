Node = Struct.new(:open, 
                  :close)


class DOMReader
  
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

end
