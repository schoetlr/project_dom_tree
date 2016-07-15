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
  /\A\<(\w)/.match(string)
  tag[:type] = $1

  /class=['"]([\w\s\-]+)['"]/.match(string)
  tag[:class] = $1.split(' ')

  /id=['"]([\w\s\-]+)['"]/.match(string)
  tag[:id] = $1

  /name=['"]([\w\s\-]+)['"]/.match(string)
  tag[:name] = $1

  tag
end


def parse_html(string)
  html = {}
  string.split(' ')
end




tag = parse_tag("<p class='foo bar' id='baz'> name='hello'")
tag.each do |pair|
  p "#{pair[0]}: #{pair[1]}"
end