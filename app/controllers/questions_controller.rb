class QuestionsController < ApplicationController
  before_action :get_test
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_quest_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = @test.questions[params[:id].to_i]
  end

  def new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_questions_path
    else
      render plain: 'Что то пошло не так'
    end
  end

  def destroy
    @test.questions[params[:id].to_i].destroy
    redirect_to test_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def get_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_quest_not_found
    render plain: 'Запрос не был найден'
  end
end
