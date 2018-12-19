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
  {title: 'Ruby', level: 1, category: categories[0], authored_tests: users[0]},
  {title: 'TypeScript', level: 1, category: categories[0], authored_tests: users[0]},
  {title: 'IQ', level: 0, category: categories[1], authored_tests: users[0]}
])
questions = Question.create!([
  {body: 'Что вернет следующие выражание? 57 / 0', test: tests[0]},
  {body: 'Что такое TypeScript?', test: tests[1]},
  {body: 'А можно пупок завязать обратно, если он развяжется?', test: tests[2]},
])
answers = Answer.create!([
  {body: 'nil', question: questions[0]},
  {body: '0', question: questions[0]},
  {body: 'ZeroDivisionError (divided by 0)', question: questions[0], correct: true},
  {body: 'Надстройка над JavaScript', question: questions[1], correct: true},
  {body: 'Самостоятельный язык программирования', question: questions[1]},
  {body: 'Препроцессор JavaScript', question: questions[1]},
  {body: 'Да, морским улом', question: questions[2]},
  {body: 'Нет', question: questions[2]},
  {body: 'Он не развяжется', question: questions[2], correct: true}
])

Result.create!([
  {user: users[1], test: tests[0]},
  {user: users[1], test: tests[1], status: true},
  {user: users[1], test: tests[2]},
  {user: users[2], test: tests[2]},
])
