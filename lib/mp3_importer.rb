
class MP3Importer

  attr_reader :path

    def initialize(path)
      @path = path
    end

    def files
      @files ||= Dir.glob("#{@path}/*.mp3").collect{ |f| f.gsub("#{@path}/", "") }
    end

    # #import takes each normalized filename and sends it to the Song class #new_by_filename
      #which creates a new song instance for each of the filenames
    # #import calls #files 
    #so it is calling the method on the MP3Importer instance
    def import
      self.files.each{|f| Song.new_by_filename(f)}
    end


end
