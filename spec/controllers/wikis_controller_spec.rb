require 'spec_helper'

describe WikisController do

  # Index -> Show a list of wikis
  describe "GET 'index' (/wikis)" do
    it "shows a list of wikis" do
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  # Show -> Shows the individual wiki
  describe "GET 'show'(/wikis/:id)" do
    it "shows the individual wiki" do
    end
  end

  # Create -> New wikis are created
  describe "POST 'create'" do
    context "with valid attributes" do 
      it "creates a new wiki in the database" do
      end
      it "redirects to the @wiki" do
      end
    end

    context "with invalid attributes" do 
      it "does not save the wiki in the database" do
      end
      it "renders the :new template" do
      end
    end
  end

  # Update -> Can update wikis
  describe "PATCH 'edit' or 'update'" do
    context "with valid attributes" do 
      it "updates the wiki in the database" do
      end
      it "redirects to the @wiki" do
      end
    end

    context "with invalid attributes" do
      it "does not update the wiki in the database" do
      end
      it "renders the :edit tempalate" do
      end
    end
  end

  # Destroy -> Can destroy wikis
  describe "DELETE 'destroy'" do 
    it "removes the wiki from the database" do
    end
    it "redirects to the wikis index page" do
    end
  end
end
