# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  
Customer.create!(
  last_name: '渡辺',
  first_name: '健仁',
  last_name_kana: 'ワタナベ',
  first_name_kana: 'ケント',
  postal_number: 5121104,
  address: '三重県四日市市美里町2068',
  phone_number: 1234567890,
  email: 'tarou@gmail.com',
  experience: false,
  comment: 'どーもよろしくお願い致します。',
  image_id: File.open('./app/assets/images/logo.png'),
  password: 'iiiiiii'
)