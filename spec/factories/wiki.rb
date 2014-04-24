FactoryGirl.define do 
	factory :wiki do
		name "First Wiki"
		user
	end

	factory :invalid_wiki, parent: :wiki do
		name nil
		user
	end
end

