class WikisController < ApplicationController
	before_filter :authenticate_user!

  def index
    #binding.pry
  	@wikis = current_user.wikis.all
    @wiki = current_user.wikis.new
  end

  def show
  	@wiki = Wiki.friendly.find(params[:id])
    @pages = @wiki.pages.includes(:user)
  end

  def new
    @users = User.all
  	@wiki = Wiki.new
  end

  def create
  	@wiki = current_user.wikis.build( wiki_params )
  	if @wiki.save
  		flash[:notice] = "Your wiki was created."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was an error posting your suggestion.  Please try again."
  		render :new
  	end
  end

  def edit
    @users = User.all
  	@wiki = Wiki.friendly.find(params[:id])
  end

  def update
  	@wiki = Wiki.friendly.find(params[:id])
  	if @wiki.update_attributes( wiki_params )
  		flash[:notice] = "Your wiki has been updated."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was a problem updating your wiki."
  		render :edit
  	end
  end

  def destroy
  	@wiki = Wiki.friendly.find(params[:id])
  	if @wiki.destroy
  		flash[:notice] = "Your wiki was removed"
  		redirect_to wikis_path
  	else
  		flash[:notice] = "Your wiki was not removed. Please try again."
  		redirect_to :back
  	end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:name, :slug)
  end
end
