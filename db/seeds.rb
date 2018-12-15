# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {name: 'Pasha', email: 'a@a.ru', password: '123'},
  {name: 'Olya', email: 'a@a.ru', password: '123'}
])
Category.create([
  {title: 'programming'},
  {title: 'humor'},
  {title: 'other'}
])
Test.create([
  {title: 'Ruby', level: 1, category_id: 1},
  {title: 'TypeScript', level: 1, category_id: 1},
  {title: 'IQ', level: 0, category_id: 2}
])
Question.create([
  {body: 'Что вернет следующие выражание? 57 / 0', test_id: 1},
  {body: 'Что такое TypeScript?', test_id: 2},
  {body: 'А можно пупок завязать обратно, если он развяжется?', test_id: 3},
])
Answer.create([
  {body: 'nil', question_id: 1},
  {body: '0', question_id: 1},
  {body: 'ZeroDivisionError (divided by 0)', question_id: 1},
  {body: 'Надстройка над JavaScript', question_id: 2},
  {body: 'Самостоятельный язык программирования', question_id: 2},
  {body: 'Препроцессор JavaScript', question_id: 2},
  {body: 'Да, морским улом', question_id: 3},
  {body: 'Нет', question_id: 3},
  {body: 'Он не развяжется', question_id: 3}
])

Result.create([
  {user_id: 1, test_id: 1},
  {user_id: 1, test_id: 2, status: true},
  {user_id: 1, test_id: 3},
  {user_id: 2, test_id: 3},

])
