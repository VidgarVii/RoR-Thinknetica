class Admin::AnswersController < Admin::BaseController

  before_action :answer_params, only: %i[create update]
  before_action :set_question,  only: %i[create new]
  before_action :set_answer,  only: %i[show destroy edit update]

  def show; end

  def edit; end

  def new
    @answer = Answer.new
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_question_path(@question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
