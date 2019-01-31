class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      Gist.create(url: result.html_url, user: current_user, question: @test_passage.current_question)
      flash[:notice] = t('.success', link_gist: link_gist(result))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  def update
    @test_passage.accept!(params[:answer_ids]) unless @test_passage.times_up?

    if @test_passage.completed?
      @test_passage.cache_result
      assign_badge
      TestPassageComplitedMailer.test_complited(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def link_gist(gist)
    view_context.link_to('Gist', gist.html_url, target: '_blank')
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def assign_badge
    badges = BadgeService.new(@test_passage).call
    unless badges.empty?
      current_user.badges << badges
      flash[:notice] = I18n.t('earned_badge')
    end
  end
end
