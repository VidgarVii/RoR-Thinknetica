class User < ApplicationRecord

  def current_test_with_level(level)
    test_ids = []
    Result.where(user_id: self.id).each do |test|
      test_ids << test.test_id
    end
    Test.where(id: test_ids).where("level = :level", level: level)
  end
end
