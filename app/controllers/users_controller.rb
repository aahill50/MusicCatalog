class UsersController < ApplicationController
  def show
    @user = current_user

    if logged_in?
      render :show
    else
      redirect_to new_session_url
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to user_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update

  end

private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
