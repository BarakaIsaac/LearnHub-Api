# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require 'faker'

puts "Deleting old data..,"
User.destroy_all
Enrollment.destroy_all
Lesson.destroy_all
Course.destroy_all


# puts "Creating courses..."
# Create roles
# roles = %w(teacher student admin)

# roles.each do |role|
#   Role.create(name: role)
# end

# Create users
User.create(
  email: 'admin@example.com',
  first_name: 'Admin',
  last_name: 'User',
  username: 'admin',
  role: 'admin',
  password: 'password'
)

2.times do |i|
  User.create(
    email: "teacher#{i + 1}@example.com",
    first_name: "Teacher#{i + 1}",
    last_name: 'Smith',
    username: "teacher#{i + 1}",
    role: 'teacher',
    password: 'password'
  )
end

10.times do |i|
  User.create(
    email: "student#{i + 1}@example.com",
    first_name: "Student#{i + 1}",
    last_name: 'Doe',
    username: "student#{i + 1}",
    role: 'student',
    password: 'password'
  )
end

# Create courses with lessons


10.times do
  teacher = User.where(role: 'teacher').order('RANDOM()').first

  course = Course.create(
    title: "Course by #{teacher.username}",
    description: "Unlock expertise in 8 weeks! Enroll now for our intensive [Course Topic] program. Achieve your goals faster!",
    instructor: "#{teacher.first_name}",
    creator_id: teacher.id,
    rating: rand(1..5)
  )

  rand(1..3).times do |i|
    Lesson.create(
      title: "Lesson #{i + 1}",
      content: "This is the content of Lesson #{i + 1}.",
      course_id: course.id

    )
end



end




# courses = [
#     {
#       title: "Introduction to Programming",
#       description: "This course provides a beginner-friendly introduction to programming concepts.",
#       instructor: "John Doe",
#       creator_id: rand(1..5),
#       rating: rand(1..5)
#     },
#     {
#       title: "Web Development Fundamentals",
#       description: "Learn the basics of web development and create your first website.",
#       instructor: "Jane Smith",
#       creator_id: rand(1..5),
#       rating: rand(1..5)
#     },
#     {
#       title: "Data Science Essentials",
#       description: "Explore the world of data science and machine learning.",
#       instructor: "David Johnson",
#       creator_id: rand(1..5),
#       rating: rand(1..5)
#     },
#     {
#       title: "Artificial Intelligence and Robotics",
#       description: "Discover the exciting field of AI and robotics engineering.",
#       instructor: "Emily Brown",
#       creator_id: rand(1..5),
#       rating: rand(1..5)
#     },
#     {
#       title: "Digital Marketing Mastery",
#       description: "Master digital marketing strategies to grow your online presence.",
#       instructor: "Michael Wilson",
#       creator_id: rand(1..5),
#       rating: rand(1..5)
#     }
#   ]

#   Course.create(courses)
  
  puts User.all
  puts Course.all
  puts Lesson.all
  puts Enrollment.all
  puts "Done seeding..."
  
