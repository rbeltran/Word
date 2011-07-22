class Dictionary < ActiveRecord::Base

	$WORDSMITH_FILE = "doc/yawl.txt"
	$WORDS_WITH_FRIENDS_FILE = "doc/enable1.txt"
	
	def initialize
		buildDictionary
	end
	
	def readDictionary
		contents = File.open( $WORDSMITH_FILE, "r" ).read
		@wordSmithHash = contents.split( /[,\s]+/ )
		contents = File.open( $WORDS_WITH_FRIENDS_FILE, "r" ).read
		@wordsWithFriendsHash = contents.split( /[,\s]+/ )
	end
	
	def buildDictionary
		if( @wordSmithHash.nil? || @wordsWithFriendsHash.nil? )
			puts "dictionaries nil. building..."
			readDictionary
		end
	end
	
	def wordsmithHasEntry?( entry )
		return @wordSmithHash.include?( entry )
	end
	
	def wordsWithFriendsHasEntry?( entry )
		return @wordsWithFriendsHash.include?( entry )
	end

end
