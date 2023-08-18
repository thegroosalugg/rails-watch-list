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

# image_urls = [
#   "https://image.tmdb.org/t/p/w200/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
#   "https://image.tmdb.org/t/p/w200/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
#   "https://image.tmdb.org/t/p/w200/9O7gLzmreU0nGkIB6K3BsJbzvNv.jpg",
#   "https://image.tmdb.org/t/p/w200/6ELJEzQJ3Y45HczvreC3dg0GV5R.jpg",
#   "https://image.tmdb.org/t/p/w200/6VmFqApQRyZZzmiGOQq2C92jyvH.jpg",
#   "https://image.tmdb.org/t/p/w200/ld7oB9vDW1pj4APN2ZD5JRKaisw.jpg",
#   "https://image.tmdb.org/t/p/w200/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg",
#   "https://image.tmdb.org/t/p/w200/lNkDYKmrVem1J0aAfCnQlJOCKnT.jpg",
#   "https://image.tmdb.org/t/p/w200/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg",
#   "https://image.tmdb.org/t/p/w200/zGVbrulkupqpbwgiNedkJPyQum4.jpg",
#   "https://image.tmdb.org/t/p/w200/y6y6Ohh33kV0vJ7kx1soe6R1fa0.jpg",
#   "https://image.tmdb.org/t/p/w200/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg",
#   "https://image.tmdb.org/t/p/w200/kBKKi4FJ2k7X0Lfx9udZm14WcR.jpg",
#   "https://image.tmdb.org/t/p/w200/9jPa6zaNlAop9GGa1B7PzDlxbAw.jpg",
#   "https://image.tmdb.org/t/p/w200/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg"
# ]


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
    title: Faker::Movie.title,
    overview: Faker::Games::Witcher.quote,
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
