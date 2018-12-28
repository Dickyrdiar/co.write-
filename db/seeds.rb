# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create(
    [
        {name: 'Programing'},
        {name: 'Traveling'},
        {name: 'Technology'}, 
        {name: 'Visual Design'}, 
        {name: 'Web Devlopment'}, 
        {name: 'Starup'}, 
        {name: 'Art'}, 
        {name: 'Design'}, 
        {name: 'Museum'}, 
        {name: 'Mental Healt'}, 
        {name: 'Creativity'}, 
        {name: 'Psycology'}, 
        {name: 'Education'}, 
        {name: 'Sport'}, 
        {name: 'society'}, 
        {name: 'Politics'},
        {name: 'Future'},
    ]
)