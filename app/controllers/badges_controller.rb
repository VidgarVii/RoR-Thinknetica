class BadgesController < ApplicationController
  def index
    @current_badges = current_user.badges
    @badges = Badge.all
  end
end
