class PagesController < ApplicationController
  def index
  	#binding.pry
  	@wikis = current_user.wikis.all
  	@pages = current_user.pages.all
  end
end
