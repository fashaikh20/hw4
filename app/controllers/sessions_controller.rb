class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by({ email: params["email"] })
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session[:user_id] = @user.id
        flash[:notice] = "Logged in as: #{@user.username}."
        redirect_to "/places"
      else
        flash[:notice] = "Login unsuccessful, please check your username and password"
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Nope"
      redirect_to "/sessions/new"
    end

  end

  def destroy
    #flash[:notice] = "Goodbye, #{@user.username}."
    session[:user_id] = nil
    redirect_to "/sessions/new"

  end

  
end
  