# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
	User.create(
		name: Faker::Name.name,
		email: Faker::Internet.email,
		password: "password"
	)


end


c = ["confirmed","unconfirmed","delivered","on_display"]


50.times do 
	Order.create(
		name: Faker::Commerce.product_name,
		price: Faker::Commerce.price,
		user_id: rand(User.all.length - 1),
		image: Faker::Avatar.image,
		confirmed: c[rand(4)],
		website: Faker::Internet.url
		
		
		
		
		
	)




end