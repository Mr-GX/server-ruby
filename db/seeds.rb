# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
users=User.create([{email:'user1@mail.com',name:'user1',activated:DateTime.now,admin:true,mobile:'18511280360'},{email:'user2@mail.com',name:'user2',activated:DateTime.now,admin:false,mobile:'18511280361'}])