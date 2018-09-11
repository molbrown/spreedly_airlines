# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all

flights = Flight.create([
    {destination: 'Honolulu, HI (HNL)', origin: 'Raleigh-Durham, NC (RDU)', price: 46400, tix_purchased: 0},
    {destination: 'Paris, France (CDG)', origin: 'Raleigh-Durham, NC (RDU)', price: 124600, tix_purchased: 0},
    {destination: 'London, UK (LHR)', origin: 'Raleigh-Durham, NC (RDU)', price: 118100, tix_purchased: 0},
    {destination: 'Auckland, NZ (AKL)', origin: 'Raleigh-Durham, NC (RDU)', price: 155800, tix_purchased: 0},
    {destination: 'Austin, TX (AUS)', origin: 'Raleigh-Durham, NC (RDU)', price: 33700, tix_purchased: 0},
    {destination: 'Anchorage, AK (ANC)', origin: 'Raleigh-Durham, NC (RDU)', price: 60400, tix_purchased: 0}
])