HTML_STRING = 
"<div>
  div text before
  <p>
    p text
  </p>
  <div>
    more div text
  </div>
  div text after
</div>"

def parse_tag(string)
  tag = {}
  /\A\<(\w+)/.match(string)
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


def parse_html(string)
  html = {}
  tags = string.scan(/(<.+>)/)
  text_nodes = string.scan(/>(.+)</)
  tags
  text_nodes
  # p $1
  # i = 1
  # array = []
  # begin
  #   array << parse_tag($i)
  #   i += 1
  # end until $i.nil?
  # array
end

p parse_html(HTML_STRING)


#test for parse_tag
# tag = parse_tag("<p class='foo bar' id='baz'> name='hello'")
# tag.each do |pair|
#   p "#{pair[0]}: #{pair[1]}"
# end