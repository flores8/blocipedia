# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

5.times do 
	user = User.new(
		name: 		Faker::Name.name,
		email: 		Faker::Internet.email,
		password: Faker::Lorem.characters(10)
		)
	user.skip_confirmation!
	user.save
end
users = User.all

# Create Wikis
10.times do 
	Wiki.create(
		user: 		users.sample,
		name: 		Faker::Lorem.sentence
		)
end
wikis = Wiki.all

50.times do
	Page.create(
		user: users.sample,
		wiki: wikis.sample,
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
		)
end

User.first.update_attributes(
	email: 'flores8@gmail.com',
	password: 'helloworld'
	)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{Page.count} pages created"