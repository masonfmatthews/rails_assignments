require 'httparty'
require 'nokogiri'

# Get the results page for Carlo Tomasi
page = Nokogiri::HTML(HTTParty.get("http://scholar.google.com/scholar?q=carlo+tomasi&hl=en&as_sdt=0,34").body)

# Get an array of links to titles
article_title_links = page.css(".gs_rt a")

# Pull out all the titles
titles = article_title_links.map {|l| l.children[0].to_s}

# Find all the publication years
years = page.css(".gs_a").map {|y| y.to_s.match(/\d{4}/)}

# Write out all the publications in the form "2013 - Paper's Awesome Title"
titles.each_with_index do |t, i|
  puts "#{years[i]} - #{t}"
end
