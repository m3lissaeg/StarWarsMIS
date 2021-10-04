# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: "Andrés Torres",
  email: "andres.torres@ehmsoft.com",
  phone: 23456789,
  rank: "master",
  jedi: true,
  admin: true,
  confirmed_at: Time.current
)

User.create(
  name: "Melissa Escobar",
  email: "andres.torres@ehmsoft.com",
  phone: 23456789,
  rank: "padawan",
  jedi: true,
  admin: true,
  confirmed_at: Time.current
)


