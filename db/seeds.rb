# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

form = LoiForm.create({
  name: Faker::Company.name,
  email: Faker::Internet.email
})
Answer.create({
  loi_id: form.id,
  question: "Why is the sky blue?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "Why did the chicken cross the road?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "What is your primary demographic?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "How much blah blah blah blah?",
  answer: Faker::Hipster.sentence(5)
})
form = LoiForm.create({
  name: Faker::Company.name,
  email: Faker::Internet.email
})
Answer.create({
  loi_id: form.id,
  question: "Why is the sky blue?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "Why did the chicken cross the road?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "What is your primary demographic?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "How much blah blah blah blah?",
  answer: Faker::Hipster.sentence(5)
})
form = LoiForm.create({
  name: Faker::Company.name,
  email: Faker::Internet.email
})
Answer.create({
  loi_id: form.id,
  question: "Why is the sky blue?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "Why did the chicken cross the road?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "What is your primary demographic?",
  answer: Faker::Hipster.sentence(5)
})
Answer.create({
  loi_id: form.id,
  question: "How much blah blah blah blah?",
  answer: Faker::Hipster.sentence(5)
})
