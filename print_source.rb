filename_of_self = File.basename(__FILE__)
File.open(filename_of_self, "r") do |file|
    source_code = file.read
    puts source_code
end