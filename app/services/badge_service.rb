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
  end

  def call
    set_test_passages

    Badge.find_each do |badge|
      @user.badges << badge if send(badge.badge_type)
    end
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
    return false if @set_test_passages.count < 10

    result = true
    @set_test_passages.each { |tp| result = false if tp.result == 100.0 }
    result
  end

  def god?
    Badge.count == @user.badges.size
  end

  def the_first_time?
    return false if @set_test_passages.count > 1

    @test_passage.result == 100.0
  end

  def first_test?
    @set_test_passages.count == 1
  end

  def set_test_passages
    @set_test_passages = @user.test_passages.where(test: @test)
  end
end
