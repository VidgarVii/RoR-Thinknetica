class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def index
    @feedbacks = current_user.feedbacks
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feadback_params)
    @feedback.author = current_user
    if @feedback.save
      FeedbacksMailer.send_message(@feedback).deliver_now
      redirect_to feedbacks_path, notice: t('.msg_send')
    else
      render :new
    end
  end

  private

  def feadback_params
    params.require(:feedback).permit(:title, :body)
  end
end

