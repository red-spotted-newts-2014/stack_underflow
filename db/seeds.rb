# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "test@test.test")

5.times do
  Question.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
end

10.times do
  Answer.create(body: Faker::Hacker.say_something_smart)
end


Tag.create(name: "testTag1")
Tag.create(name: "testTag2")
Tag.create(name: "testTag3")
Tag.create(name: "testTag4")
Tag.create(name: "testTag5")
Tag.create(name: "testTag6")
Tag.create(name: "testTag7")



User.all.each do |user|
  user.questions << Question.all.sample
end

Question.all.each do |q|
  rand(3..5).times do
    q.answers << Answer.all.sample
    q.responses << Response.create(body: Faker::Hacker.say_something_smart)
    q.tags << Tag.all.sample
  end
end

Answer.all.each do |a|
  5.times do
    a.responses << Response.create(body: Faker::Hacker.say_something_smart)
  end
end
