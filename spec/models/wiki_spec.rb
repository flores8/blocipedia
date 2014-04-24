require 'spec_helper'

describe Wiki do

	it "has a name" do
		@wiki = build(:wiki)
		@wiki.name.should eq("First Wiki")
	end
	it "is invalid without a name" do
		@wiki = build(:wiki, name: " ")
		@wiki.should_not be_valid
	end
	it "has a user relationship" do
		@wiki = build(:wiki)
		@wiki.user.name.should eq("Jane Doe")
	end
end