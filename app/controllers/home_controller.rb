class HomeController < ApplicationController
  

  def initialize
	@dictionary = Dictionary.new
  end
  
  def index
    @query = params[ :query ]
	if( !@query.nil? )
		@resultWS = @dictionary.wordsmithHasEntry?( @query )
		@resultWWF = @dictionary.wordsWithFriendsHasEntry?( @query )
	end
  end

end
