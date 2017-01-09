User.delete_all
users=User.create([{email:'user1@mail.com',name:'user1',activated:DateTime.now,admin:true},{email:'user2@mail.com',name:'user2',activated:DateTime.now,admin:false}])