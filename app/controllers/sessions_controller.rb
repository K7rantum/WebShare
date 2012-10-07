class SessionsController < ApplicationController
  
  attr_accessor :email, :password
  
  before_filter :authenticate
  
  def new
    @title = "Sign in"
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user_path
    else
      flash.now[:error] = "Invalid email or password."
      @title = "Sign in"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  
  private
  
    def authenticate
      if session_has_been_associated?
        self.current_user = User.find_by_email_and_password(self.email, self.password)
      else
        associate_session_to_user
      end
      
    end
    
    def associate_session_to_user
      self.id = self.match.id
    end
    
    def session_has_been_associated?
      self.id
    end
end
