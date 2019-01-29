class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    set_test_passages
    @badges = Badge.where.not(id: @user.badges.ids)
  end

  def call
    @badges.select { |badge| send(badge.badge_type, badge.option) }
  end

  private

  def category?(category)
    test_ids = Test.all_with_category(category).ids
    test_ids.size == count_tests_success(test_ids) && @test.category.title == category
  end

  def madness?(count)
    @current_test_passages.none?(&:success?) && @current_test_passages.count == count.to_i
  end

  def god?(_params)
    Badge.count == @user.badges.uniq.size
  end

  def the_first_time?(_params)
    @current_test_passages.count == 1 if @test_passage.success?
  end

  def passed_tests_of_level?(level)
    test_ids = Test.where(level: level).ids
    test_ids.size == count_tests_success(test_ids) && @test.level == level.to_i
  end

  def count_tests_success(test_ids)
    @user.test_passages.where(test_id: test_ids).select(&:success?).size
  end

  def set_test_passages
    @current_test_passages = @user.test_passages.where(test: @test)
  end
end
