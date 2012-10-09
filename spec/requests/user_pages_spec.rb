require 'spec_helper'

describe "User pages" do
  
  'render_views'
  
  subject { page }

  describe "Profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('h1', :text => user.username) }
    it { should have_selector('title', :text => user.username) }
  end

  describe "Sign up page" do
    before { visit signup_path }

    it { should have_selector('h1', :text => 'Sign up') }
  end
  
  describe "Sign up" do
    before { visit signup_path }
    let(:submit) { "Start Now" }
    
    describe "with invalid info" do
      it "should not create user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Username", :with => "SigninUser"
        fill_in "Email", :with => "Signin@user.com"
        fill_in "Password", :with => "Signinpassw"
        fill_in "Confirmation", :with => "Signinpassw"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        it { should have_link('Sign out') }
      end
    end
  end
end 
