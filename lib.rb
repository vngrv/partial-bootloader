filename = '04711.mp3'

module Audio
    def partial_upload
        File.open(filename) do |mp3|
            mp3.seek(-128, IO::SEEK_END)
            mp3.read
        end
    end
end 

p id3.class
p id3

