# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Deleting old data..,"
Course.destroy_all

puts "Creating courses..."

10.times do
    course = Course.create(
        title: Faker::Educator.course_name,
        description: Faker::Lorem.paragraph,
        instructor: Faker::Name.name,
        creator_id: rand(1..4),
        rating: rand(1..5)
    )
end

