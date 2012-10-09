require 'spec_helper'

describe "Authentication pages" do
  
  subject { page }

  describe "sign in" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }
      it { should have_selector('title', :text => full_title('')) }
      it { should have_error_message('Invalid username/password combination.') }
    end
 
    describe "with valid information" do
      user = FactoryGirl.create(:user)
      visit signin_path
      fill_in "Email", :with => user.email
      fill_in "Password", :with => user.password
      click_button "Sign in"
      it { should have_selector('title', :text => full_title('')) }
      it { should have_link('Sign out') }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end    
  end
end
