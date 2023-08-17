# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'pry-byebug'

Movie.delete_all

15.times do
  m = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Games::Witcher.quote,
    poster_url: Faker::Internet.url(host: 'imdb.com'),
    rating: rand(0.1..10.0).round(1)
  )
  m.save! unless Movie.find_by(title: m.title)
end
