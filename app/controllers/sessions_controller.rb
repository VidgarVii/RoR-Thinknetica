class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to cookies.delete(:fullpath) || root_path
    else
      flash[:alert] = t('auth_error')
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to root_path
  end
end
