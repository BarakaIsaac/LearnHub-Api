# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

# puts "Deleting old data..,"
# Course.destroy_all

# puts "Creating courses..."

# 10.times do
#     course = Course.create(
#         title: Faker::Educator.course_name,
#         description: Faker::Lorem.paragraph,
#         instructor: Faker::Name.name,
#         creator_id: rand(1..4),
#         rating: rand(1..5)
#     )
# end

data = [
    {
      title: "Introduction to Programming",
      description: "This course provides a beginner-friendly introduction to programming concepts.",
      instructor: "John Doe",
      creator_id: rand(1..4),
      rating: rand(1..5)
    },
    {
      title: "Web Development Fundamentals",
      description: "Learn the basics of web development and create your first website.",
      instructor: "Jane Smith",
      creator_id: rand(1..4),
      rating: rand(1..5)
    },
    {
      title: "Data Science Essentials",
      description: "Explore the world of data science and machine learning.",
      instructor: "David Johnson",
      creator_id: rand(1..4),
      rating: rand(1..5)
    },
    {
      title: "Artificial Intelligence and Robotics",
      description: "Discover the exciting field of AI and robotics engineering.",
      instructor: "Emily Brown",
      creator_id: rand(1..4),
      rating: rand(1..5)
    },
    {
      title: "Digital Marketing Mastery",
      description: "Master digital marketing strategies to grow your online presence.",
      instructor: "Michael Wilson",
      creator_id: rand(1..4),
      rating: rand(1..5)
    }
  ]
  
  puts data
  
