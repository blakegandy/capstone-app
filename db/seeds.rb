# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Blake", last_name: "Gandy", email: "blake@gmail.com", phone_number: "812-887-7033", password_digest: "password", stylist: false, salon: "", image_url: "", specialty: "")
User.create(first_name: "Amber", last_name: "Picou", email: "amber@gmail.com", phone_number: "555-555-5555", password_digest: "password1", stylist: true, salon: "Close Shave", image_url: "", specialty: "Hot Towel Shaves")
User.create(first_name: "Merrow", last_name: "Ragan", email: "merrow@gmail.com", phone_number: "972-456-1790", password_digest: "password2", stylist: false, salon: "", image_url: "", specialty: "")
Appointment.create(stylist_id: 1, client_id: 1, date: 10/16/20, time: 1030, details: "Haircut")
Appointment.create(stylist_id: 1, client_id: 2, date: 10/22/20, time: 200, details: "Haircut")
Appointment.create(stylist_id: 1, client_id: 1, date: 10/10/20, time: 1245, details: "Haircut")
Product.create(user_id: 2, name: "Conditioner", description: "conditioner that softens your hair.", quantity: 5, price: 8.00, image_url: "" )
Product.create(user_id: 2, name: "Styling Pomeade", description: "A styling product to hold your hair up.", quantity: 10, price: 12.00, image_url: "" )
Product.create(user_id: 2, name: "Anti-Frizz Shampoo", description: "A shampoo designed to prevent your hair from getting frizzy.", quantity: 7, price: 15.00, image_url: "" )