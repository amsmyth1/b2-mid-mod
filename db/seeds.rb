# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

RideMechanic.destroy_all
Ride.destroy_all
Mechanic.destroy_all

jane = Mechanic.create(name: "Jane Goodwin", years_experience: 10)
jack = Mechanic.create(name: "Jack Yarn", years_experience: 8)
mike = Mechanic.create(name: "Mike Bigalo", years_experience: 5)
meg = Mechanic.create(name: "Meg Shell", years_experience: 15)
bob = Mechanic.create(name: "Bob Bobberan", years_experience: 30)
betty = Mechanic.create(name: "Betty Sweaty", years_experience: 1)

kingda_ka = Ride.create(name: "Kingda Ka", thrill_rating: 10, open: false)
nitro = Ride.create(name: "Nitro", thrill_rating: 8, open: true)
toro = Ride.create(name: "El Toro", thrill_rating: 6, open: true)
batman = Ride.create(name: "Batman The Ride", thrill_rating: 7, open: true)

jane.rides << kingda_ka
jane.rides << nitro
jane.rides << toro
jane.rides << batman
meg.rides << kingda_ka
meg.rides << nitro
meg.rides << toro
meg.rides << batman
bob.rides << kingda_ka
bob.rides << nitro
bob.rides << toro
bob.rides << batman

jack.rides << batman
jack.rides << toro
jack.rides << nitro
mike.rides << batman
mike.rides << toro
betty.rides << batman
