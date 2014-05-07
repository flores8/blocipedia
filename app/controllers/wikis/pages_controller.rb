class Wikis::PagesController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @wiki = Wiki.friendly.find(params[:wiki_id])
  	@page = Page.friendly.find(params[:id])
    @pages = @wiki.pages(params[:wiki_id])
  end

  def new
    @wiki = Wiki.friendly.find(params[:wiki_id])
  	@page = Page.new
  end

  def create 
    @wiki = Wiki.friendly.find(params[:wiki_id])
  	@page = current_user.pages.build( pages_params )
    @page.wiki = @wiki

  	if @page.save 
  		redirect_to [@wiki, @page], notice: "Page was saved successfully."
  	else
  		flash[:error] = "Your page was not created. Please try again."
  		render :new
  	end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:wiki_id])
  	@page = Page.friendly.find(params[:id])
  end

  def update
    @wiki = Wiki.friendly.find(params[:wiki_id])
  	@page = Page.friendly.find(params[:id])
  	if @page.update_attributes(pages_params)
  		flash[:notice] = "Your page was updated!"
  		redirect_to [@wiki, @page]
  	else
  		flash[:error] = "Your page was not saved. Please try again."
  		render :edit
  	end
  end

  def destroy
    @wiki = Wiki.friendly.find(params[:wiki_id])
  	@page = Page.friendly.find(params[:id])
  	if @page.destroy
  		flash[:notice] = "Your page was removed."
  		redirect_to @wiki
  	else
  		flash[:error] = "There was a problem removing your page. Please try again."
  		redirect_to :show
  	end
  end

  private

  def pages_params
    params.require(:page).permit(:title, :body, :slug)
  end
end
