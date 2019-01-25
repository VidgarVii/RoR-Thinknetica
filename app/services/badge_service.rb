class BadgeService
  # Безумие - Если 10 раз прошел один и тот же тест и не получил 100%
  # C первого раза - Пройденный тест на 100%  с первого раза
  # Гик - прошел все тесты на 100% по программированию
  # Бог - получил все ачивки
  # Первый раз - пройден первый тест

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @earned_badges = []
    set_test_passages
  end

  def call
    Badge.find_each { |badge| @earned_badges << badge if send(badge.badge_type) }
    @earned_badges
  end

  private

  def category?(category)
    test_ids = Category.find(1).tests.ids
    test_passages = @user.test_passages.where(test_id: test_ids)
    test_passages.all? { |test_passage| test_passage.success? }
  end

  def madness?(count)
    return false if @current_test_passages.count != count

    @current_test_passages.any? { |test_passage| test_passage.success? } ? true : false
  end

  def god?
    Badge.count == @user.badges.size
  end

  def the_first_time?
    return false if @current_test_passages.count > 1

    @test_passage.success?
  end

  def first_test?
    @current_test_passages.count == 1
  end

  def passed_tests_of_level?(level)
    tests_with_level = Test.send(level)
    return false unless tests_with_level.include?(@test)

    @test_passage.where(test: tests_with_level)
  end

  def set_test_passages
    @current_test_passages = @user.test_passages.where(test: @test)
  end
end
