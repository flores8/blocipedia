# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Wikis
10.times do 
	Wiki.create(name: Faker::Lorem.sentence)
end

50.times do
	Page.create(
		title: Faker::Lorem.sentence,
		body: Faker::Lorem.paragraph
		)
end

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{Page.count} pages created"