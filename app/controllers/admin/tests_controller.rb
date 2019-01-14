class Admin::TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start show edit update destroy]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = User.first #Временная заглушка

    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
