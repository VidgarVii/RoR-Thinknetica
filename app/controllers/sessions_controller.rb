class SessionsController < ApplicationController
  def new
  end

  def create
    @_current_user = User.find_by(email: params[:email])

    if @_current_user&.authenticate(params[:password])
      session[:current_user_id] = @_current_user.id
      redirect_to cookies[:fullpath]
    else
      flash[:alert] = t('auth_error')
      render :new
    end
  end

  def destroy
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_path
  end
end
