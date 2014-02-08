class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params_user

    if login @user.username, @user.password
      redirect_to new_sessions_path, notice: "you've signed in."
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit(:username, :password)
  end
end
