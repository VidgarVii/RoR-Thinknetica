class User < ApplicationRecord
  def current_test_with_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id")
        .where(results: { user_id: id }, tests: { level: level })
  end
end
