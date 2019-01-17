class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def gist
    gist = GistQuestionService.new(@test_passage.current_question).call
    if gist.success?
      Gist.create(url: gist.respons.html_url, user: current_user, question: @test_passage.current_question)
      flash[:notice] = t('.success', link_gist: link_gist(gist))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
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

  def link_gist(gist)
    view_context.link_to('Gist', gist.respons.html_url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
