# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Item.destroy_all
Reservation.destroy_all

user_one = User.create!(username: 'Peter')
user_two = User.create!(username: 'Safa')
user_three = User.create!(username: 'Lameck')
user_four = User.create!(username: 'Teddy')

item_one = Item.create!(name: 'Executive Suite', location: 'Nairobi CBD', image: "https://stylesatlife.com/wp-content/uploads/2019/11/best-office-table-designs.jpg", description: 'A place to work')
item_one.services.create!(name: 'Coffee')
item_one.services.create!(name: '4G Internet')
item_one.services.create!(name: 'Kitchenette')
item_one.services.create!(name: 'Washroom')
item_one.services.create!(name: 'Meeting lounge')

item_two = Item.create!(name: 'Traditional Office Space', location: 'Nairobi CBD', image: "https://stylesatlife.com/wp-content/uploads/2019/11/best-office-table-designs.jpg", description: 'A place to work')
item_two.services.create!(name: 'Coffee')
item_two.services.create!(name: '4G Internet')
item_two.services.create!(name: 'Kitchenette')
item_two.services.create!(name: 'Washroom')

item_three = Item.create!(name: 'Creative Office Space', location: 'Nairobi CBD', image: "https://stylesatlife.com/wp-content/uploads/2019/11/best-office-table-designs.jpg", description: 'A place to work')
item_three.services.create!(name: 'Coffee')
item_three.services.create!(name: '4G Internet')
item_three.services.create!(name: 'Kitchenette')
item_three.services.create!(name: 'Washroom')

item_four = Item.create!(name: 'Contiguous Office Space', location: 'Nairobi CBD', image: "https://stylesatlife.com/wp-content/uploads/2019/11/best-office-table-designs.jpg", description: 'A place to work')
item_four.services.create!(name: 'Coffee')
item_four.services.create!(name: '4G Internet')
item_four.services.create!(name: 'Kitchenette')
item_four.services.create!(name: 'Washroom')
item_four.services.create!(name: 'Meeting lounge')

item_five = Item.create!(name: 'Coworking Space', location: 'Nairobi CBD', image: "https://stylesatlife.com/wp-content/uploads/2019/11/best-office-table-designs.jpg", description: 'A place to work')
item_five.services.create!(name: 'Coffee')

item_six = Item.create!(name: 'Shared Office Space', location: 'Nairobi CBD', image: "https://stylesatlife.com/wp-content/uploads/2019/11/best-office-table-designs.jpg", description: 'A place to work')
item_six.services.create!(name: 'Coffee')

Reservation.create!(user_id: user_one.id, item_id: item_one.id, start_date: '2019-01-01', end_date: '2019-01-02')
Reservation.create!(user_id: user_two.id, item_id: item_two.id, start_date: '2019-01-01', end_date: '2019-01-02')
Reservation.create!(user_id: user_three.id, item_id: item_three.id, start_date: '2019-01-01', end_date: '2019-01-02')
Reservation.create!(user_id: user_four.id, item_id: item_four.id, start_date: '2019-01-01', end_date: '2019-01-02')
