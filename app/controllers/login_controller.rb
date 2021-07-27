class LoginController < ApplicationController
  def index
  end

  def authorize
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/app'
    else
      message = "Username or Password Incorrect"
      redirect_to login_path, flash: {"notice": session[:user_id]}
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
