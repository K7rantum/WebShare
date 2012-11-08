include UsersHelper

class UsersController < ApplicationController
  
  before_filter :correct_user, :only => [:edit, :update]
  
  def index
    @users = User.all
    @title = "Who's on WebShare"
  end
  
  def new
    @user  = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash.now[:success] = "Welcome to WebShare"
      redirect_to @user
    else
      flash.now[:error] = @user.errors
      render 'new'
    end
  end

  def edit
    @user  = User.find(params[:id])
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      @user.save
      sign_in @user
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def show
    @user  = User.find(params[:id])
    @title = @user.username
  end

  def destroy
    @user = User.find(params[:id])

    if current_user?(@user)
      sign_out
      @user.destroy
      flash[:success] = "User was successfully deleted"
    else
      flash[:error]  = "Cannot delete current admin"
    end
      redirect_to users_path
  end
  
  def correct_user
    user = User.find(params[:id])
  end
end
