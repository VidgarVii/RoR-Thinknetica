class BadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_badges = current_user.badges
    @badges = Badge.where.not(id: @current_badges.ids)
  end
end
