# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "管理者",
  nickname:  "管理者",
  email: "admin@gmail.com",
  password:  "00000000",
  password_confirmation: "00000000",
  # admin: true
)

User.create!(
  name: "山田",
  nickname:  "TEST1",
  email: "test1@gmail.com",
  password:  "11111111",
  password_confirmation: "11111111",
)

User.create!(
  name: "井上",
  nickname:  "TEST2",
  email: "test2@gmail.com",
  password:  "22222222",
  password_confirmation: "22222222",
)

# Group_user.create!(
#   group_id: "1",
#   user_id: "1",
# )

# Group_user.create!(
#   group_id: "2",
#   user_id: "1",
# )

# Group_user.create!(
#   group_id: "1",
#   user_id: "2",
# )

# Group_user.create!(
#   group_id: "2",
#   user_id: "2",
# )

# Group_user.create!(
#   group_id: "1",
#   user_id: "3",
# )

# Group.create!(
#   name: "A",
# )
# Group.create!(
#   name: "B",
# )


# Message.create!(
#   content: "test1",
#   image: "test1",
# )

# Message.create!(
#   content: "test2",
#   image: "test2",
# )

# Message.create!(
#   content: "test2",
#   image: "test2",
# )
