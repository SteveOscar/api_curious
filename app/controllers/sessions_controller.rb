class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    if @user
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
