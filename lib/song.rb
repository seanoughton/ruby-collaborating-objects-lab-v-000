class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    song_title = filename.split(" - ")[1]
    song_artist = filename.split(" - ")[0]
    new_song = self.new(song_title)
    new_song.artist_name = song_artist
    new_song
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end

end
