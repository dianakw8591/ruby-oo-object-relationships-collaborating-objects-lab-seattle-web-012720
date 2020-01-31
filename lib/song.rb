require 'pry'
class Song

    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.new_by_filename(file_name)
        arr = file_name.split(" - ")
        artist_name = arr[0]
        song_name = arr[1]
        # genre = arr[2]
        song = Song.new(song_name)
        artist = Artist.find_or_create_by_name(artist_name)
        song.artist = artist
        # song.genre = genre
        song
    end

    def artist_name=(artist_name)
       art = Artist.find_or_create_by_name(artist_name)
       art.add_song(self)
    end
end

# binding.pry
