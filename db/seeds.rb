# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(user_name: "admin",
			email: "admin@gmail.com",
			password: "admin", 
			password_confirmation: "admin",
            role: 1,
			is_active: true)


10.times do |n|
	name = Faker::Name.name
<<<<<<< HEAD
	email = "example-#{n+1}@railstutorial.org" 
=======
	email = "user-#{n+1}@gmail.com" 
>>>>>>> 22ae0aaed3cc7406d89b6a8f93fed72d1d80b8b8
	password = "password"
	User.create!(user_name: name,
				email: email,
				password: password, 
                password_confirmation: password,
                role: 0,
                is_active: true)
end

10.times do |n|
    name = Faker::Job.education_level
    Category.create!(category_name: name)
<<<<<<< HEAD
=======
end

users =User.order(:created_at).take(6)
30.times do  
	description =Faker::Lorem.sentence(50)  
	book_name = Faker::Job.field 
	author = Faker::Artist.name
	publish_date = Time.now
	rating = Faker::Number.between(from: 1, to: 5) #=> 7
	status = Faker::Number.between(from: 0, to: 1)
	category_id = Faker::Number.between(from: 1, to: 10) 
	users.each {|user| user.books.create!(description: description,book_name: book_name,author: author, publish_date: publish_date,rating: rating,status: status,category_id: category_id ) }
>>>>>>> 22ae0aaed3cc7406d89b6a8f93fed72d1d80b8b8
end