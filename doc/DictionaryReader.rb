class Dictionary

	WORDSMITH_FILE = "yawl.txt"
	
	def readDictionary
		contents = File.open( 'r', ).read
		@wordSmithHash = contents.split( '[,\\s]+' )
	end
	
	def getDictionary
		if( @wordSmithHash.empty? )
			readDictionary
		end
		return @wordSmithHash
	end
	
end

	Dictionary dict = Dictionary.new
	hash = dict.getDictionary
	words = Array.new( "zee", "trooz", "cabin", "dkshdls", "treez", "snoop" )
	
	words.each do |word|
		if( !hash[ word ].nil? )
			puts "Found "+word+"\n"
		else
			puts word + " not found in Wordsmith dictionary\n"
		end
	end
