class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    flash = result ? { notice: t('.success', link_gist: link_gist(result)) } : {alert: t('.failure')}

    redirect_to @test_passage, flash
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def link_gist(result)
    view_context.link_to('Gist', result.html_url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
