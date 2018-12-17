# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!([
  {name: 'Admin', email: 'admin@admin.ru', password: '123'},
  {name: 'Pasha', email: 'a@a.ru', password: '123'},
  {name: 'Olya', email: 'a@a.ru', password: '123'}
])
category = Category.create!([
  {title: 'programming'},
  {title: 'humor'},
  {title: 'other'}
])
test = Test.create!([
  {title: 'Ruby', level: 1, category_id: category[0].id, user_id: user[0].id},
  {title: 'TypeScript', level: 1, category_id: category[0].id, user_id: user[0].id},
  {title: 'IQ', level: 0, category_id: category[1].id, user_id: user[0].id}
])
question = Question.create!([
  {body: 'Что вернет следующие выражание? 57 / 0', test_id: test[0].id},
  {body: 'Что такое TypeScript?', test_id: test[1].id},
  {body: 'А можно пупок завязать обратно, если он развяжется?', test_id: test[2].id},
])
answer = Answer.create!([
  {body: 'nil', question_id: question[0].id},
  {body: '0', question_id: question[0].id},
  {body: 'ZeroDivisionError (divided by 0)', question_id: question[0].id},
  {body: 'Надстройка над JavaScript', question_id: question[1].id},
  {body: 'Самостоятельный язык программирования', question_id: question[1].id},
  {body: 'Препроцессор JavaScript', question_id: question[1].id},
  {body: 'Да, морским улом', question_id: question[2].id},
  {body: 'Нет', question_id: question[2].id},
  {body: 'Он не развяжется', question_id: question[2].id}
])

Result.create!([
  {user_id: user[1].id, test_id: test[0].id},
  {user_id: user[1].id, test_id: test[1].id, status: true},
  {user_id: user[1].id, test_id: test[2].id},
  {user_id: user[2].id, test_id: test[2].id},
])
