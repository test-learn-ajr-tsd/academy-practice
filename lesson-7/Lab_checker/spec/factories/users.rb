FactoryBot.define do 
	factory :user do
		first_name { Faker::Name.first_name }
		last_name { Faker::Name.last_name }
		email { Faker::Internet.email(domain: 'gmail.com', name: first_name+last_name) }
	end
end