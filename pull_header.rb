seq = File.open(ARGV[0]"sequence.fasta")
headers = File.open(ARGV[1]"headers.txt")
seq.grep(/>/) do |line|
    headers.puts line
end


##seq.each do |line|
 ##   if line [0..0] == ">"
   ##     puts line
   ## end
##end
