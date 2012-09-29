class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only   => [:edit, :update]
  before_filter :admin_user,   :only   => :destroy

  def index
	  @title = "All users"
	  @users = User.paginate(:page => params[:page])
  end
  
  def show
    @user  = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page])
	  @title = @user.name
  end # show

  def new
    @user  = User.new
    @title = "Sign up"
  end # new
  
  def create
	  @user = User.new(params[:user])
	  if @user.save
	    sign_in @user
	    flash[:success] = "Welcome to the sample app!"
	    redirect_to @user
	  else
	    @title = "Sign up"
	    render 'new'
	  end
  end # create
  
  def edit
    @title = "Edit user"
  end # edit
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
  end
end
