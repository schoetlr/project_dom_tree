def parse_tag(string)
  tag = {}
  /\A\<(\w)/.match(string)
  tag[:type] = $1

  /\bclass=\'(\w+)\'/.match(string)
  tag[:class] = $1

  
  tag
end


tag = parse_tag("<p class='foo bar' id='baz'>")
p tag[:class]