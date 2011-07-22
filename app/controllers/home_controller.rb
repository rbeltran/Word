class HomeController < ApplicationController
  

  def initialize
	@dictionary = Dictionary.new
  end
  
  def index
    @query = params[ :query ]
	@resultWS = @dictionary.wordsmithHasEntry?( @query )
	@resultWWF = @dictionary.wordsWithFriendsHasEntry?( @query )
  end

end
