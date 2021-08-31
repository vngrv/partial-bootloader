require 'pry'

class Audio
    def partial_upload(filename) 
        File.open(filename) do |mp3|
            mp3.seek(-128, IO::SEEK_END)
            mp3.read
        end
    end

    def upload(filename)
        File.open(filename)
    end
end 

class MetaReader
    def call(id3)
        case id3.class
        when 'string'
            read_string(id3)
        when 'file'
            read_file(id3)
        else
            raise "Read is not avaulable"
    end

    private 

    def read_file
        # 
    end 

    def read_string (id)
        raise "No ID3 tags" if id3 !~ /^TAG/

        p id3.unpack('xxxA30A30A30A4A30C1')
        @title, @artist, @album, @year, @comment, @genre = id3.unpack('xxxA30A30A30A4A30C1')
        @comment, @track = @comment.unpack('Z*@28C1') if @comment =~ /\0.$/
    end
end

if __FILE__ == $0
    audio = Audio.new()

    part_file = audio.partial_upload('../resources/04711.mp3')
    file = audio.upload('../resources/04711.mp3')

    binding.pry
    p part_file.instance_methods
    p file.instance_methods

  end