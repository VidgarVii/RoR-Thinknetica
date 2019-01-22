class BadgeService
  # Безумие - Если 10 раз прошел один и тот же тест и не получил 100%
  # Первый тест - Пройденный первый тест на 100%
  # Гик - прошел все тесты на 100% по программированию
  # Бог - получил все ачивки

  def call

  end

  private

  def geek?
    test_ids = Category.find(1).tests.ids
    code_test_passages = current_user.test_passages.where(test_id: test_ids)
    check = true
    code_test_passages.each { |test_passage| check = false if test_passage.result != 100.0 }
    check
  end

  def god?
    current_user.badges.size == Badge.count
  end

  def madness?
    @result_of_search.size >= 10
  end

  def first_test?
    @result_of_search.size == 1
  end

  def search_tests(id)
    @result_of_search = current_user.test_passages.where(test_id: id)
  end
end
