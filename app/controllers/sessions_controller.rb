class SessionsController < ApplicationController
  
  attr_accessor :email, :password
  
  before_filter :authenticate
  
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email or password."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      redirect_to user_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  
  private
  
    def authenticate
      unless session_has_been_associated?
        self.match = User.find_by_email_and_password(self.email, self.password)
      end
      associate_session_to_user
    end
    
    def associate_session_to_user
      self.id ||= self.match.id
    end
    
    def session_has_been_associated?
      self.id
    end
end
