# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'pry-byebug'
require 'open-uri'
require 'json'

puts "Getting rid of all the stuff"
List.destroy_all
Movie.destroy_all
Bookmark.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated?"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
Movie.destroy_all
movies["results"].each do | movie |
  poster_url = movie["poster_path"]
  new_movie = Movie.new(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{poster_url}",
    rating: rand(0.1..10.0).round(1)
  )
  new_movie.save
end

# used API for images as using faker gives the same image to every instance

# 15.times do
#   m = Movie.new(
#     title: Faker::Movie.title,
#     overview: Faker::Games::Witcher.quote,
#     poster_url: Faker::Internet.url(host: 'imdb.com'),
#     rating: rand(0.1..10.0).round(1)
#   )
#   m.save! unless Movie.find_by(title: m.title)
# end
