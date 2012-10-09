require 'spec_helper'

describe "Static pages" do
  
  subject { page }

  describe "Sign in page" do
    before { visit signin_path }
    it { should have_selector('h1', :text => 'Sign in') }
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => '| #{page}') }
  end
 
  describe "Services page" do
    before { visit services_path }

    it { should have_selector('h1', :text => 'Services') }
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => '| #{page}') }
  end
 
  describe "Portfolio page" do
    before { visit portfolio_path }

    it { should have_selector('h1', :text => 'Portfolio') }
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => '| #{page}') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', :text => 'About') }
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => '| #{page}') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => '| #{page}') }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1', :text => 'Contact') }
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => '| #{page}') }
  end
end 
