class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.username
      redirect_to root_url
    else
      redirect_to login_url, alert: "Invalid stuff!"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_url
  end
end
