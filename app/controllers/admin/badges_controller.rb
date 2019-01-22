class BadgesController < ApplicationController
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def show; end


  def create

  end

  def edit; end

  def update

  end

  def destroy

  end
end
