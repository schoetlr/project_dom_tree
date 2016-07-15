#Pseudocode for dom_reader

#Node will have have children attribute which is an array, and a parent attribute
#Each child is a node and will have children themselves
#Node's children are in order

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


def split_on_tag(string)
  string.split(/\<\/*[\w\s]+\>/)
end

p split_on_tag(HTML_STRING)