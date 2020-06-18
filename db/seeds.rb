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
  profile:"ここの管理者をしております。よろしくお願いいたします。",
  # admin: true
)

User.create!(
  name: "テスト1",
  nickname:  "テスト1",
  email: "test1@gmail.com",
  password:  "11111111",
  password_confirmation: "11111111",
  profile:"初めまして、テスト１です。よろしくお願いいたします。",
)

User.create!(
  name: "テスト2",
  nickname:  "テスト2",
  email: "test2@gmail.com",
  password:  "22222222",
  password_confirmation: "22222222",
  profile:"初めまして、テスト２です。よろしくお願いいたします。",
)
