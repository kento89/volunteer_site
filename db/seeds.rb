# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  
Recruiter.create!(
  last_name: '山田',
  first_name: '太郎',
  last_name_kana: 'ワタナベ',
  first_name_kana: 'ケント',
  postal_number: 5121104,
  address: '三重県四日市市美里町2068',
  phone_number: 1234567890,
  email: 'tarou@gmail.com',
  image_id: File.open('./app/assets/images/logo.png'),
  password: 'iiiiiii'
)

Recruiter.all.each do |recruiter|
  recruiter.volunteer.create!(
  name: 'ゴミ拾い',
  a_litle_explanation: '工場のゴミ拾いです',
  explanation: '四日市コンビナートのゴミ拾い及び清掃活動を行います',
  place: '四日市市コンビナート第一工場',
  time: Time.current.beginning_of_day,
  people: 3,
  merit: '工場内の職人と知り合えます',
  necessary_item: 'ゴミ袋、軍手、ドリンク',
  important_point: '時折有毒なガスがタンクより漏れることもあり生命維持活動に影響を与えることがあります',
  comment: 'やる気ある若者諸君、その燃えたぎる情熱を発揚せよ',
  limit: Time.current.beginning_of_day,
  genre: 1,
  )
end
  
  recruiter.valunteer.each do |volunteer|
    volunteer.room.create!(
    )
  end