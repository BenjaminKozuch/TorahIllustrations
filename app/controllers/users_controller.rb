class UsersController < ApplicationController
  

  def new

  	@user = User.new
  	# from here to user view to create action and back to this  action if save didnt work

  end

  def show
  	@user = User.find( params[:id] )
  	#debugger
  end


  #params is a hash with a key called :user and value {name: "Foo Bar", email: "foo@invalid",
                 #password: "foo", password_confirmation: "bar"}
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Torah Illustrations!"	
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

end
