require 'pry'

class Artist

    @@all = []
    def self.all
        @@all
    end

    attr_accessor :name
    def initialize(name)
        @name = name
        self.class.all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        art =  Artist.all.find {|artist| artist.name == name}
        if art.nil?
            Artist.new(name)
        else
            art
        end
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
end

# binding.pry
