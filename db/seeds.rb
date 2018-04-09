# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Jury.delete_all
Presentation.delete_all
Location.delete_all
location = Location.create(name: "Зал 1")

pdf = Presentation.create([{
  name: "Лаборатория", path: "Lab", authors: "Тестовые авторы", location: location
},
{
  name: "ФБР", path: "FBI", authors: "Фейковые авторы", location: location
}])

jury = Jury.create(name: "Тестовый член жюри", location: location)