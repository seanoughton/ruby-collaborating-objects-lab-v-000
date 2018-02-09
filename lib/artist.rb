class Artist

  attr_accessor :name, :songs

  @@all = [] #array of artists instances

  def initialize(name)#artist_name
    @name = name
    @songs = [] #array of songs for each instance
  end

  #this exposes the @@all Class Variable
  def self.all
    @@all
  end

  def add_song(song)
    #called by the song instance, adds in that song instance
    #called inside the song method #artist_name=
    #after the song has been created, assigned a name
    #the song class checks to see if there is an artist associated with the song, and if there isnt' one, it asks the Artist class to create an artist instance
    #it then passes that artist instance back to the song to store as an attribute
    #the song class then calls this method #add_song
    #this method adds the song to the artist instances song array
    #every artist instance has this array
    @songs << song
  end

  #def self.find_or_create_by_name(name)
  #end



  #def self.create(name)
  #end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    @@all.find do |artist|
      artist.name == name
    end
  end

  #def self.find(name)
    #self.all.find {|artist| artist.name == name }
  #end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def save
    @@all << self
  end

  #this method prints out an array of song names
  #by accessing the name attribute of each song
  def print_songs()
    puts @songs.collect {|x| x.name}
  end

end

#def self.find_or_create_by_name(artist_name)
  #if !(@@all.find {|x|x.name == artist_name})
    #artist = self.new(artist_name) #creates a new artist instance
    #@@all << artist #adds the artist instance to @all
  #else
    #(@@all.find {|x|x.name == artist_name})
  #end
#end
