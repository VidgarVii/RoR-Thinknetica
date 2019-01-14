# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  {first_name: 'Pasha', email: 'a@a.ru', password: '123456'},
  {first_name: 'Olya', email: 'o@o.ru', password: '123456'}
])
categories = Category.create!([
  {title: 'programming'},
  {title: 'humor'},
  {title: 'other'}
])
tests = Test.create!([
  {title: 'Ruby', level: 1, category: categories[0], author: users[0]},
  {title: 'TypeScript', level: 1, category: categories[0], author: users[0]},
  {title: 'IQ', level: 0, category: categories[1], author: users[0]}
])
questions = Question.create!([
  {body: 'Что вернет следующие выражание? 57 / 0', test: tests[0]},
  {body: 'Что такое TypeScript?', test: tests[1]},
  {body: 'А можно пупок завязать обратно, если он развяжется?', test: tests[2]},
  {body: 'Что делают альпинисты, когда у них заканчивается туалетная бумага?', test: tests[2]},
  {body: 'Почему топ-менеджеры есть, а топ-дворников нет?', test: tests[2]},
  {body: 'Почему литр апельсинового сока стоит дешевле килограмма апельсинов?', test: tests[2]},
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
  {body: 'Он не развяжется', question: questions[2], correct: true},
  {body: 'Настоящие суровые альпинисты протираются снегом и камнями. А фикалии забирают с собой.', question: questions[3], correct: true},
  {body: 'Пару капсул лоперамида и в туалет больше не ходим', question: questions[3]},
  {body: 'Значит пора спускаться вниз', question: questions[3]},
  {body: 'Все альпинисты носят памперсы', question: questions[3]},
  {body: 'Не придумали', question: questions[4]},
  {body: 'Такая профессия есть. Top cleaner manager', question: questions[4], correct: true},
  {body: 'Дворник уже звучит гордо', question: questions[4]},
  {body: 'Концентрат(не более 30%). Либо при создании данного сока ни один апельсин не пострадал.', question: questions[5], correct: true},
  {body: 'Регулирование цен', question: questions[5]},
  {body: 'Сок стоит дороже', question: questions[5]}
])
