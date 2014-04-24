require 'spec_helper'

describe WikisController do
  before :each do
    @wiki = create(:wiki)
    user = create(:user)
    request.env['warden'].stub :authenticate! => user
    controller.stub :current_user => user
  end

  # Index -> Show a list of wikis
  describe "GET 'index' (/wikis)" do
    it "shows a list of wikis" do
      get :index 
      assigns(:wikis).should eq([@wiki])
    end

    it "returns http success" do
      get 'index'
      response.should render_template :index
    end
  end

  # Show -> Shows the individual wiki
  describe "GET 'show'(/wikis/:id)" do
    it "shows the individual wiki" do
      get :show, id: @wiki
      assigns(:wiki).should eq(@wiki)
    end

    it "returns hhtp success" do
      get 'show', id: @wiki
      response.should render_template :show
    end
  end

  # Create -> New wikis are created
  describe "POST 'create'" do
    context "with valid attributes" do 
      it "creates a new wiki in the database" do
        expect {
          post :create, wiki: attributes_for(:wiki)
        }.to change(Wiki,:count).by(1)
      end
      it "redirects to the @wiki" do
        #expect { put :create, wiki: attributes_for(:wiki) }.to redirect_to :action => 'show', id: @wiki
      end
    end

    context "with invalid attributes" do 
      it "does not save the wiki in the database" do
        expect {
          post :create, wiki: attributes_for(:invalid_wiki)
        }.to_not change(Wiki,:count)
      end
      it "renders the :new template" do
        post :create, wiki: attributes_for(:invalid_wiki)
        response.should render_template :new
      end
    end
  end

  # Update -> Can update wikis
  describe "PATCH 'update'" do
    before :each do 
      @wiki = create(:wiki, name: "Test")
    end

    context "with valid attributes" do 
      it "located the requested @wiki" do
        patch :edit, id: @wiki, wiki: attributes_for(:wiki)
        assigns(:wiki).should eq(@wiki)
      end

      it "changes @wiki's attributes" do 
        patch :update, id: @wiki, wiki: attributes_for(:wiki, name: "Testing Change")
        @wiki.reload
        @wiki.name.should eq("Testing Change")
      end
      it "redirects to the @wiki" do
        patch :edit, id: @wiki, wiki: attributes_for(:wiki)
        #response.should redirect_to @wiki
      end
    end

    context "with invalid attributes" do
      it "located the requested @wiki" do
        patch :update, id: @wiki, wiki: attributes_for(:invalid_wiki)
        assigns(:wiki).should eq(@wiki)
      end
      it "does not update the wiki in the database" do
        patch :update, id: @wiki, wiki: attributes_for(:wiki, name: nil)
        @wiki.reload
        @wiki.name.should_not eq(nil)
      end
      it "renders the :edit tempalate" do
        patch :update, id: @wiki, wiki: attributes_for(:invalid_wiki)
        response.should render_template :edit
      end
    end
  end

  # Destroy -> Can destroy wikis
  describe "DELETE 'destroy'" do 
    it "removes the wiki from the database" do
      expect {
          delete :destroy, id: @wiki
        }.to change(Wiki,:count).by(-1)
    end
    it "redirects to the wikis index page" do
      delete :destroy, id: @wiki
      response.should redirect_to wikis_url
    end
  end
end
