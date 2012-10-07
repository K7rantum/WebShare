

class UsersController < ApplicationController
  
  before_filter :correct_user, :only => [:edit, :update]
  
  def new
    @user  = User.new
    @title = "Sign up"
  end
  
  def index
    @users = User.all
    @title = "Who's on WebShare"
  end

  def show
    @user  = User.find(params[:id])
    @title = @user.username
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      current_user=(@user)
      flash[:success] = "Welcome to WebShare"
      redirect_to @user
    else
      @title = "Sign up"
      flash[:error] = "Welcome to WebShare"
      redirect_to new_user_path
    end
  end

  def edit
    @user  = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
  
    def correct_user
      user = User.find(params[:id])
      if authorized_user(user)
        flash[:success] = "Click the Save button at any time to save your progress."
      else
        flash[:error] = "Here, you can edit your own profile."
        redirect_to root_path
      end
    end
    
end
