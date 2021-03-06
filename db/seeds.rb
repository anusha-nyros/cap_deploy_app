# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'ffaker'

class FakeUsers
	def seed
		5.times do |i|
		      User.create!(
			  name:     Faker::Name.name,
			  address:  Faker::AddressCA.city
		      )
		end
	end
end

fusers = FakeUsers.new
fusers.seed
