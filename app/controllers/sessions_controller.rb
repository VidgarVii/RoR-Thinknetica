class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = "Привет #{current_user.first_name}!"
  end
end
