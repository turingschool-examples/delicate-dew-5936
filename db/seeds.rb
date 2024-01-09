# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@park = AmusementPark.create!(name: "Blonkoland", admission_cost: 20)
@ride = @park.rides.create!(name: "The Pukinator", thrill_rating: 7, open: true)
@mechanic = @ride.mechanics.create!(name: "Mario", years_experience: 32)

@ride_2 = @park.rides.create!(name: "The Reverse Mortgage", thrill_rating: 10, open: false)
@ride_3 = @park.rides.create!(name: "Bagman's Crumper", thrill_rating: 3, open: true)
@mechanic.rides << @ride_2