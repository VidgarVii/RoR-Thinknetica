class BadgeService
  # Безумие - Если 10 раз прошел один и тот же тест и не получил 100%
  # Первый тест - Пройденный первый тест на 100%
  # Гик - прошел все тесты на 100% по программированию
  # Бог - получил все ачивки

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    # current_user.badges << badge
    # ???????
  end

  private

  def geek?
    test_ids = Category.find(1).tests.ids
    code_test_passages = @user.test_passages.where(test_id: test_ids)
    check = true
    code_test_passages.each { |test_passage| check = false if test_passage.result != 100.0 }
    check
  end

  def madness?
    test_passages = @user.test_passages.where(test: @test)
    return false if test_passages.count < 10
    result = true
    test_passages.each { |tp| result = false if tp.result == 100.0 }
    result
  end

  def god?
    Badge.count == @user.badges.size
  end

  def first_test?
    @user.test_passages.where(test: @test).count == 1
  end
end
