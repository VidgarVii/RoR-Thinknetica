class User < ApplicationRecord
  def current_test_with_level(level)
    Test.joins("INNER JOIN results ON results.test_id = tests.id")
        .where("results.user_id = #{self.id} AND tests.level = :level", level: level)
  end
end
