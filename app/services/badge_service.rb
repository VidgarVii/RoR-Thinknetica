class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    set_test_passages
  end

  def call
    Badge.select { |badge| send(badge.badge_type, badge.option) }
  end

  private

  def category?(category)
    tests = Test.all_with_category(category)
    test_successfully?(tests) if @test.category.title == category
  end

  def madness?(count)
    return false if @current_test_passages.count != count.to_i

    @current_test_passages.none?(&:success?)
  end

  def god?(_params)
    Badge.count == @user.badges.uniq.size
  end

  def the_first_time?(_params)
    @current_test_passages.count == 1 if @test_passage.success?
  end

  def passed_tests_of_level?(level)
    tests = Test.where(level: level)
    test_successfully?(tests) if @test.level == level.to_i
  end

  def test_successfully?(tests)
    if tests.exists?
      tests.all? { |test| @user.test_passages.where(test: test).any?(&:success?) }
    else
      false
    end
  end

  def set_test_passages
    @current_test_passages = @user.test_passages.where(test: @test)
  end
end
