class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) #changed from "remember user"
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Added .now so that flash goes away when a new page is requested
      render 'new'
    end
  end

  def destroy
    log_out if logged_in? #Listing 8.42:
    redirect_to root_url
  end
end
