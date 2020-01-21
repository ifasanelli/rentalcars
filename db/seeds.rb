# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client = Client.create!(name: 'Lúcia', 
    cpf: '939.718.887-23', 
    email: 'lucia@lucia.com')
car_category = CarCategory.create!(name: 'AA', 
               daily_rate: 165.6, 
               car_insurance: 80.59, 
               third_party_insurance: 55.95)
Rental.create!(code: 'CA000', 
                start_date: 1.day.from_now, 
                end_date: 5.day.from_now, 
                client: client, 
                car_category: car_category)
Rental.create!(code: 'CA001', 
                start_date: 1.week.from_now, 
                end_date: 2.week.from_now, 
                client: client, 
                car_category: car_category)
Rental.create!(code: 'CA002', 
                start_date: 20.day.from_now, 
                end_date: 25.day.from_now, 
                client: client, 
                car_category: car_category)