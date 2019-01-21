class TestPassageComplitedMailer < ApplicationMailer

  def test_complited(test_passage)
    @user = test_passage.user
    @test_passage = test_passage

    mail to: @user.email, subject: t('test_complited', test: @test_passage.test.title)
  end
end
