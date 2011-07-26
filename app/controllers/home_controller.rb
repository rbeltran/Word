class HomeController < ApplicationController
  

  def initialize
	@dictionary = Dictionary.new
  end
  
  def index
    @query = params[ :query ]
	if( !@query.nil? )
		@resultWS = @dictionary.wordsmithHasEntry?( @query.downcase )
		@resultWWF = @dictionary.wordsWithFriendsHasEntry?( @query.downcase )
	end
  end

end
