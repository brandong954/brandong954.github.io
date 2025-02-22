require 'yaml'

site_posts_path = "_posts"
genres_dir = "_genres"

Dir.mkdir(genres_dir) unless Dir.exist?(genres_dir)

genres = []

Dir.glob("#{site_posts_path}/*.*").each do |post|
  front_matter = YAML.load_file(post, permitted_classes: [Time])
  if front_matter['genres']
    front_matter['genres'].each do |genre|
      genres << genre unless genres.include?(genre)
    end
  end
end

genres.each do |genre|
  genre_slug = genre.downcase.gsub(" ", "-")
  File.open("#{genres_dir}/#{genre_slug}.md", "w") do |file|
    file.puts "---"
    file.puts "layout: genre"
    file.puts "title: #{genre}"
    file.puts "genre: #{genre}"
    file.puts "---"
  end
end

puts "Generated genre pages."
