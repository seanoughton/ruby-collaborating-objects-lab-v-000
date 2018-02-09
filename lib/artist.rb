class Artist

  attr_accessor :name, :songs

  @@all = [] #array of artists instances

  def initialize(name)#artist_name
    @name = name
    @songs = [] #array of songs for each instance
  end


  def self.all
    @@all
  end

  def add_song(song) #called by the song instance, adds in that song instance
    @songs << song
  end

  def self.find_or_create_by_name(artist_name)
    if !(@@all.find {|x|x.name == artist_name})
      artist = self.new(artist_name) #creates a new artist instance
      #@@all << artist #adds the artist instance to @all
    else
      (@@all.find {|x|x.name == artist_name})
    end
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def save
    @@all << self
  end

  def print_songs()
    puts @songs.collect {|x| x.name}
  end

end
