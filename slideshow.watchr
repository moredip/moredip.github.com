watch( '.*\.md' ) do |m|
  show_name = m.to_s[/(.*)\.md/,1]
  system 'slideshow', show_name, '-t', 'g5.txt' 
end
