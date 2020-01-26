# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


manufacturer = Manufacturer.create(name: 'Volvo')
car_category = CarCategory.create!(name: 'B', 
                                   daily_rate: 95.98, 
                                   car_insurance: 30.45, 
                                   third_party_insurance: 22.99)
car_model = CarModel.create!(name: 'XC-60', 
                             year: '2017', 
                             manufacturer: manufacturer, 
                             motorization: '1.6', 
                             car_category: car_category, 
                             fuel_type: 'Gasolina')
other_car_model = CarModel.create!(name: 'XC-80', 
                                   year: '2019', 
                                   manufacturer: manufacturer, 
                                   motorization: '1.8', 
                                   car_category: car_category, 
                                   fuel_type: 'Gasolina')
subsidiary = Subsidiary.create!(name: 'Filial São José', 
                                cnpj: '10.131.313/0001-13', 
                                address: 'Rua dos Santos, 13')
other_subsidiary = Subsidiary.create!(name: 'Filial Pirituba', 
                                      cnpj: '11.141.414/0001-14', 
                                      address: 'Rua de Osasco, 14')
car = Car.create!(license_plate: 'ABC-1234', 
                  color: 'Prata', 
                  car_model: car_model, 
                  mileage: '180', 
                  subsidiary: subsidiary,
                  status: 0)
other_car = Car.create!(license_plate: 'DEF-5678', 
                        color: 'Branco', 
                        car_model: other_car_model, 
                        mileage: '40', 
                        subsidiary: other_subsidiary,
                        status: 5)