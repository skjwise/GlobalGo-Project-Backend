# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
# Theme.delete_all
# Country.delete_all
# Project.delete_all

user = User.create(
    first_name: "Sarah",
    last_name: "Wise",
    username: "sarah",
    email: "sarahwise.305@gmail.com",
    password_digest: "123"   
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

# uk = Country.create(name:"United Kingdom")
# us = Country.create(name:"United States")
# india = Country.create(name:"India")
# indonesia = Country.create(name:"Indonesia")

# project1 = Project.create(status: "active", 
#     summary: "Empowering rural Afghan women and girls in Sar Asia and Jaghartun, Herat, through education and training opportunities as well as health and reproductive health services.",
#     title: "Learning Centers for Rural Women in Herat",
#     image_url: "https://www.globalgiving.org/pfil/354/pict_grid1.jpg",
#     project_link: "https://www.globalgiving.org/projects/help-disabled-children-in-india/",
    # country:"India",
    # funding: 3908.0,
    # goal: 7260,
    # latitude:
    # longitude:
    # need:"No education has been available to women and girls in the western province of Herat, Afghanistan, for the last decade under the Taliban regime. Project partner AIL began offering Women's Learning Centers to women and girls in rural Herat during 2003. These health and education services at Sar Asia and Jaghartun include a maternal/child health clinic, literacy and skills training classes. This project will ensure continuation of these urgently needed, accessible, culturally sensitive services.",
    # long_term_impact:"A full array of medical and educational services are offered to hard-to-reach rural women and girls through Women's Learning Center sites at Jaghartun and Sar Asia. These centers improve the education and health of Afghan women in the region.",
    # activities: "Literacy, English, and income-generating skills classes are offered at the Women's Learning Center in Sar Asia and serve about 540 women per month. The clinic in Jaghartun provides over 2,500 patients per month with medical care and health education.",
    # donation_descriptions: "15 women will learn to read.",
    # theme_id: 4,
    # country_id: 
    # organization_id:
    # donation_amounts: 25
# )
# t.integer "gg_project_id"
# t.integer "gg_organization_id"
