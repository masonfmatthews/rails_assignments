class Artist
  def initialize(name)
    @name = name
    @albums = []
  end

  def name
    @name
  end

  def assign(album)
    @albums << album
  end

  def album_names
    name_strings = []
    @albums.each do |a|
      name_strings << a.name
    end
    name_strings.join(", ")
  end

  def discount_catalog(percent)
    @albums.each {|a| a.discount(percent)}
  end

end
