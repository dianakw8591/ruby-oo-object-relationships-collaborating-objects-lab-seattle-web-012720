require 'pry'
class MP3Importer

    attr_reader :path
    def initialize(path)
        @path = path
    end

    def files #returns an array of all the files in the folder
        Dir.children(self.path)
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end

# binding.pry

