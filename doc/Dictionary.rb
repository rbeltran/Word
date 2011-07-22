class Dictionary

	$WORDSMITH_FILE = "yawl.txt"
	
	def readDictionary
		contents = File.open( $WORDSMITH_FILE, "r" ).read
		@wordSmithHash = contents.split( /[,\s]+/ )
	end
	
	def getDictionary
		if( @wordSmithHash.nil? )
			readDictionary
		end
		return @wordSmithHash
	end
	
end

if __FILE__ == $0

	dict = Dictionary.new
	hash = dict.getDictionary
	puts hash.length 
	puts hash.include?("aboli")
	print "[",hash[1],"]"
	puts "[",hash[200],"]"
	words = [ "zee", "trooz", "cabin", "dkshdls", "trooz", "aberrants" ]
	words.each do |word|
		if( hash.include?( word) )
			puts "Found "+word+"\n"
		else
			puts word + " not found in Wordsmith dictionary\n"
		end
	end
end