require 'spec_helper'

describe User do

  before do
    @user = User.new(:username => "thisUserGuy", :email => "kasdfklj1@email.com", :password => "exampleUser")
  end

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end

end
