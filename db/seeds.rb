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
    password: "123"   
)

# theme1 = Theme.create(name: "Education")
# theme2 = Theme.create(name: "Animals")
# theme3 = Theme.create(name:"Health")
# theme4 = Theme.create(name:"Children")
# theme5 = Theme.create(name:"Human Rights")
# theme6 = Theme.create(name:"Environment")
# theme7 = Theme.create(name:"Hunger")
# theme8 = Theme.create(name:"Sport")
# theme9 = Theme.create(name:"Woman and Girls")
# theme10 = Theme.create(name:"Technology")
# theme11 = Theme.create(name:"Disaster Recovery")
# theme12 = Theme.create(name:"Climate Change")


