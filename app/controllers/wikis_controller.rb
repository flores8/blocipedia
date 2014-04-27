class WikisController < ApplicationController
	before_filter :authenticate_user!

  def index
  	@wikis = current_user.wikis.all
    @wiki = current_user.wikis.new
  end

  def show
  	@wiki = Wiki.find(params[:id])
  end

  def new
  	@wiki = Wiki.new
  end

  def create
  	@wiki = current_user.wikis.build(params.require(:wiki).permit(:name))
  	if @wiki.save
  		flash[:notice] = "Your wiki was created."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was an error posting your suggestion.  Please try again."
  		render :new
  	end
  end

  def edit
  	@wiki = Wiki.find(params[:id])
  end

  def update
  	@wiki = Wiki.find(params[:id])
  	if @wiki.update_attributes(params.require(:wiki).permit(:name))
  		flash[:notice] = "Your wiki has been updated."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was a problem updating your wiki."
  		render :edit
  	end
  end

  def destroy
  	@wiki = Wiki.find(params[:id])
  	if @wiki.destroy
  		flash[:notice] = "Your wiki was removed"
  		redirect_to wikis_path
  	else
  		flash[:notice] = "Your wiki was not removed. Please try again."
  		redirect_to :back
  	end
  end
end
