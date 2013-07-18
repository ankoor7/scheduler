class SessionsController < ApplicationController
  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Goodbye.'
  end

  def create
    user = Person.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_or_root
      # redirect_to root_url, notice: 'logged in!'
    else
      flash.now.alert = 'invalid login credentials!'
      render 'new'
    end
  end
end
