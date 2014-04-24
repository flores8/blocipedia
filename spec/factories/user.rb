FactoryGirl.define do 
	factory :user do
		name "Jane Doe"
		sequence(:email, 100) { |n| "jane#{n}@example.com" } 
		password "helloworld"
		password_confirmation "helloworld"
		confirmed_at Time.now
	end
end