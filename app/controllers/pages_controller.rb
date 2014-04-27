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

  def edit
  	@page = Page.find(params[:id])
  end

  def update
  	@page = Page.find(params[:id])
  	if @page.update_attributes(params.require(:page).permit(:title, :body))
  		flash[:notice] = "Your page was updated!"
  		redirect_to @page
  	else
  		flash[:error] = "Your page was not saved. Please try again."
  		render :edit
  	end
  end

  def destroy
  	@page = Page.find(params[:id])
  	if @page.destroy
  		flash[:notice] = "Your page was removed."
  		redirect_to pages_path
  	else
  		flash[:error] = "There was a problem removing your page. Please try again."
  		redirect_to :back
  	end
  end
end
