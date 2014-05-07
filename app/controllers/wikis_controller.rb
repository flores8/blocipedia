class WikisController < ApplicationController
	before_filter :authenticate_user!, except: [:show]

  def index
    #binding.pry
  	@wikis = current_user.wikis.all
    @wiki = current_user.wikis.new
    @owner = Collaborator.where(user_id: current_user.id, role: "owner")
    @collaborations = Collaborator.where(user_id: current_user.id, role: "collaborator")
  end

  def show
  	@wiki = Wiki.friendly.find(params[:id])
    @pages = @wiki.pages.includes(:user)

    authorize @wiki if @wiki.private
  end

  def new
    @users = User.all
  	@wiki = Wiki.new
    authorize @wiki
  end

  def create
  	@wiki = current_user.wikis.build( wiki_params )
    @wiki.private = false
    authorize @wiki
  	if @wiki.save
      @collaborator = Collaborator.create(user_id: current_user.id, wiki_id: @wiki.id, role: "owner")
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
    authorize @wiki
  end

  def update
  	@wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
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
    authorize @wiki
  	if @wiki.destroy
  		flash[:notice] = "Your wiki was removed."
  		redirect_to wikis_path
  	else
  		flash[:notice] = "Your wiki was not removed. Please try again."
  		redirect_to :back
  	end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:name, :slug, :private)
  end
end
