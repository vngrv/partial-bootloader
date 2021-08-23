module Audio
    def partial_upload(filename, shift = -128)
        File.open(filename) do |mp3|
            mp3.seek(shift, IO::SEEK_END)
            mp3.read
        end
    end
end 
