class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:username])
      session[:user_id] = user.id

      redirect_to :posts, notice: "Login Successful."
    else
      flash.alert = "Login Failed."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    render "new", notice: "Logged out, Goodbye."
  end
end
