class Dictionary

	$WORDSMITH_FILE = "doc/yawl.txt"
	$WORDS_WITH_FRIENDS_FILE = "doc/enable1.txt"
	
	def initialize
		buildDictionary
	end
	
	def readDictionary
		contents = File.open( $WORDSMITH_FILE, "r" ).read
		$wordSmithHash = contents.split( /[,\s]+/ )
		contents = File.open( $WORDS_WITH_FRIENDS_FILE, "r" ).read
		$wordsWithFriendsHash = contents.split( /[,\s]+/ )
		updateWWF
	end
	
	def updateWWF
		deletedWords = File.open( "doc/wwf-deleted.txt", "r" ).read
		deletedWords2 = File.open( "doc/wwf-deleted_4_02.txt", "r" ).read
		deletedArray = deletedWords.split( /[,\s]+/ ).map{ |element| element.downcase } 
		deletedArray2 = deletedWords2.split( /[,\s]+/ ).map{ |element| element.downcase }
		 puts "WWF size = " + $wordsWithFriendsHash.length.to_s
		$wordsWithFriendsHash = $wordsWithFriendsHash - ( deletedArray + deletedArray2 )
		puts "WWF size = " << $wordsWithFriendsHash.length.to_s
		added = File.open( "doc/wwf-added.txt", "r" ).read
		$wordsWithFriendsHash = $wordsWithFriendsHash + added.split( /[,\s]+/ ).map{ |item| item.downcase }
		puts "WWF size = " + $wordsWithFriendsHash.length.to_s
	end
	
	def buildDictionary
		if( $wordSmithHash.nil? || $wordsWithFriendsHash.nil? )
			puts "dictionaries nil. building..."
			readDictionary
		end
	end
	
	def wordsmithHasEntry?( entry )
		return $wordSmithHash.include?( entry )
	end
	
	def wordsWithFriendsHasEntry?( entry )
		return $wordsWithFriendsHash.include?( entry )
	end

end
