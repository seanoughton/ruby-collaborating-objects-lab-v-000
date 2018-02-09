
class MP3Importer

  attr_reader :path

    def initialize(path)
      @path = path
    end

    def files
      @files ||= Dir.glob("#{@path}/*.mp3").collect{ |f| f.gsub("#{@path}/", "") }
    end


    #this takes each normalized filename and sends it to the Song class method new_by_filename
    #which creates a new song instance for each of the filenames
    #this method takes the return of the files method, so it calls the files method
    def import
      files.each{|f| Song.new_by_filename(f)}
    end


end
