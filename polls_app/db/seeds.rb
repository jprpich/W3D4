# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

# u1, u2 = User.create! [{ username: 'Jonah'}, {username: 'Josh'}]
# p1 = Poll.create! title: 'Favorite Food', user: u1
# q1 = Question.create! text: 'What type of food do you like?', poll: p1
# q2 = Question.create! text: 'What is your favorite food?', poll: p1
# a1 = AnswerChoice.create! text: 'burritos', question: q2
# # Response.create! user: u1, answer_choice: a1
# Response.create! user: u2, answer_choice: a1