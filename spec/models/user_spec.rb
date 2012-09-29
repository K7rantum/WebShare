require 'spec_helper'

describe User do

  before { @user = User.new(:username => "Exampleuser", :email => "example@mail.com") }

  subject { @user }

  it { should respond_to(:username) }
  it { should respond_to(:email) }
end
