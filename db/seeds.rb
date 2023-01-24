# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Comment.destroy_all
Like.destroy_all
Post.destroy_all
Notification.destroy_all
Invitation.destroy_all
User.destroy_all 


User.create!([{
  email: "mike@aol.com",
  password: "password",
  username: "mike"
},
{
  email: "logan@aol.com",
  password: "password",
  username: "logan"
},
{
  email: "kendall@aol.com",
  password: "password",
  username: "kendall"
},
{
  email: "roman@aol.com",
  password: "password",
  username: "roman"
},
{
  email: "shiv@aol.com",
  password: "password",
  username: "shiv"
}])


Invitation.create!([{
  user_id: User.find_by(username: "logan").id,
  friend_id: User.find_by(username: "mike").id,
  confirmed: false
},
{
  user_id: User.find_by(username: "kendall").id,
  friend_id: User.find_by(username: "mike").id,
  confirmed: false
},
{
  user_id: User.find_by(username: "roman").id,
  friend_id: User.find_by(username: "mike").id,
  confirmed: false
},
{
  user_id: User.find_by(username: "shiv").id,
  friend_id: User.find_by(username: "mike").id,
  confirmed: false
}])

Post.create!([{
  user_id: User.find_by(username: "mike").id,
  body: "Today is a great day!"
},
{
  user_id: User.find_by(username: "logan").id,
  body: "I am feeling good!"
},
{
  user_id: User.find_by(username: "mike").id,
  body: "I hope my team wins sport ball"
},
{
  user_id: User.find_by(username: "kendall").id,
  body: "Hello world"
},
{
  user_id: User.find_by(username: "logan").id,
  body: "Feeling down today"
},
{
  user_id: User.find_by(username: "shiv").id,
  body: "Mike shouldnt see this"
}])