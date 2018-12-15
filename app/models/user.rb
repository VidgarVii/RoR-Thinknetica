class User < ApplicationRecord
  attr_reader :current_tests

  def current_test(test)
    @current_tests ||= []
    @current_tests << test
  end

  def current_test_whis_level(level)
    @current_tests.select { |test| test.level == level}
  end
end
