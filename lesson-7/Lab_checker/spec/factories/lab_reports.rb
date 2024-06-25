FactoryBot.define do 
	factory :lab_report do
		association :user, factory: :user
		title { Faker::Lorem.word }
    	description { Faker::Lorem.word }
    	grade { 'None' }
	end
end