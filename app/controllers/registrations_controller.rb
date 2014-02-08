class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params_user

    if @user.save
      redirect_to new_registrations_path, notice: "you've signed up."
    else
      render :new
    end
  end

  def edit
  end

  private

  def params_user
    params.require(:user).permit(:username, :email, :password)
  end
end
