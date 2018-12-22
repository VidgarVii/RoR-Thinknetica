module TestsHelper
  def test_header(test)
    test.new_record? ? t('actions.creates.test') : t('actions.update.test')
  end
end
