class CollaboratorsController < ApplicationController
  def index
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  	@collaborators = @wiki.collaborators
  end

  def show
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  	@collaborator = @wiki.collaborators.where(:user_id)
  end

  def new
  	@users = User.all
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  	@collaborator = @wiki.collaborators.new
  end

  def create
  	@user = User.find(params[:collaborator][:user_id])
  	@wiki = Wiki.friendly.find(params[:wiki_id])
  	@collaborator = @wiki.collaborators.new( collaborator_params )
    @collaborator.role = "collaborator"
  	if @collaborator.save
  		flash[:notice] = "Contributors have been successfully added to this wiki."
  		redirect_to wiki_collaborators_path
  	else
  		flash[:error] = "There was a problem adding contributors.  Please try again."
  		redirect_to :show
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  	@collaborator = Collaborator.find(params[:id])
    # @wiki = @collaborator.wiki
    # @user = @collaborator.user
  	if @collaborator.delete
  		flash[:success] = "Contributor has been removed from this wiki."
  		redirect_to wiki_collaborators_path
  	else
  		flash[:error] = "There was a problem removing contributors. Please try again."
  		redirect_to :show
  	end
  end

  private 

  def collaborator_params
  	params.require(:collaborator).permit(:user_id, :wiki_id)
  end
end
