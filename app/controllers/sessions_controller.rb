class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(session_params)
    @user.valid?
    email = params[:user][:email]
    password = params[:user][:password]
    user = User.find_by_credentials(email, password)

    if user
      log_in!(user)
      redirect_to user_url
    else
      # flash.now[:errors] = ["Cannot log in with those credentials"]
      if @user.errors.full_messages.empty?
        flash.now[:errors] = ["Error logging in"]
      else
        flash.now[:errors] = @user.errors.full_messages
      end
      render :new
    end
  end

  def destroy
    log_out!(current_user)
    redirect_to new_session_url
  end

private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
