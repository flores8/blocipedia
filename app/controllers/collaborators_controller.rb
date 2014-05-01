class CollaboratorsController < ApplicationController
  def index
  	@collaborators = current_user.collaborators.all
  	@users = User.all
  	@wikis = current_user.wikis.all
  	#@collaborator = @users.find(params[:id])
  end

  def show
  	@wiki = Wiki.friendly.find(params[:id])
  	@collaborators = @wiki.collaborators.all
  	#@wiki = @wikis.find(params[:wiki_id])
  end

  def new
  	@users = User.all
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  	@collaborator = @wiki.collaborators.new
  end

  def create
  	@users = User.all
  	@user = User.find(params[:user_id])
  	@wiki = Wiki.friendly.find(params[:id])
  	@collaborator = Collaborator.build( collaborator_params )
  	if @collaborator.save
  		flash[:notice] = "Contributors have been successfully added to this wiki."
  		redirect_to :show
  	else
  		flash[:error] = "There was a problem adding contributors.  Please try again."
  		redirect_to :show
  	end
  end

  def destroy
  end

  private 

  def collaborator_params
  	params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end
