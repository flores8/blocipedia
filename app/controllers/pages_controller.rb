class PagesController < ApplicationController
  def index
  	@pages = Page.all
  end

  def show
  	@page = Page.find(params[:id])
  end

  def new
  	@page = Page.new
  end

  def create 
  	@page = current_user.pages.build(params.require(:page).permit(:title, :body))
  	if @page.save 
  		flash[:notice] = "Your page was created!"
  		redirect_to @page
  	else
  		flash[:error] = "Your page was not created. Please try again."
  		render :new
  	end
  end
end
