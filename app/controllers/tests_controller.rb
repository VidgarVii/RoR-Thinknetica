class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update]

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
    @test.authored_tests = User.first #Временная заглушка

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

  private

  def test_params
    params.require(:test).permit(:title, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
