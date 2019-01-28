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
    Test.all_with_category(category)

    # test_ids = Category.find(category).tests.ids
    # test_passages = @user.test_passages.where(test_id: test_ids)
    # test_passages.all?(&:success?)
  end

  def madness?(count)
    return false if @current_test_passages.count != count

    @current_test_passages.none?(&:success?)
  end

  def god?(_params)
    Badge.count == @user.badges.uniq.size
  end

  def the_first_time?(_params)
    @current_test_passages.count == 1 if @test_passage.success?
  end

  def passed_tests_of_level?(level)
    @current_test_passages.size == Test.where(level: level.to_i).count
  end

  def set_test_passages
    @current_test_passages = @user.test_passages.where(test: @test)
  end
end
