FactoryBot.define do 

	factory :user, class: User  do 
		email {Faker::Internet.email}
		password {"password"}
	end


	factory :guest_user, class: User do
		email {Faker::Internet.email}
		guest {true}
		to_create {|instance| instance.save(validate: false)}

	end

	factory :trip, class: Trip do
		from {"United Kingdom"}
		to {"Spain"}
		date {Time.now.next_week}
	end

	factory :order, class: Order do
		name {"A funny name"}
		website {"Faker::Internet.website"}
		confirmed {"unconfirmed"}		
			
	end


	

end