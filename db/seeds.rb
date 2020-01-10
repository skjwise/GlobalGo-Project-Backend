# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Theme.delete_all

user = User.create(
    first_name: "Sarah",
    last_name: "Wise",
    username: "sarah",
    email: "sarahwise.305@gmail.com",
    password_digest: "123"   
)

theme1 = Theme.create(
    name: "Eduction"
)
theme2 = Theme.create(
    name: "Animals"
)
theme3 = Theme.create(
    name:"Health"
)