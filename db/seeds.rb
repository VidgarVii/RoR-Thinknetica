# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  {name: 'Admin', email: 'admin@admin.ru', password: '123'},
  {name: 'Pasha', email: 'a@a.ru', password: '123'},
  {name: 'Olya', email: 'a@a.ru', password: '123'}
])
categories = Category.create!([
  {title: 'programming'},
  {title: 'humor'},
  {title: 'other'}
])
tests = Test.create!([
  {title: 'Ruby', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'TypeScript', level: 1, category_id: categories[0].id, user_id: users[0].id},
  {title: 'IQ', level: 0, category_id: categories[1].id, user_id: users[0].id}
])
questions = Question.create!([
  {body: 'Что вернет следующие выражание? 57 / 0', test_id: tests[0].id},
  {body: 'Что такое TypeScript?', test_id: tests[1].id},
  {body: 'А можно пупок завязать обратно, если он развяжется?', test_id: tests[2].id},
])
answers = Answer.create!([
  {body: 'nil', question_id: questions[0].id},
  {body: '0', question_id: questions[0].id},
  {body: 'ZeroDivisionError (divided by 0)', question_id: questions[0].id},
  {body: 'Надстройка над JavaScript', question_id: questions[1].id},
  {body: 'Самостоятельный язык программирования', question_id: questions[1].id},
  {body: 'Препроцессор JavaScript', question_id: questions[1].id},
  {body: 'Да, морским улом', question_id: questions[2].id},
  {body: 'Нет', question_id: questions[2].id},
  {body: 'Он не развяжется', question_id: questions[2].id}
])

Result.create!([
  {user_id: users[1].id, test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[1].id, status: true},
  {user_id: users[1].id, test_id: tests[2].id},
  {user_id: users[2].id, test_id: tests[2].id},
])
