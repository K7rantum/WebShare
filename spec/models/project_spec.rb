require 'spec_helper'

describe Project do

  before { @project = Project.new(:projectName => "project1") }

  subject { @user }

  it { should respond_to(:projectName) }

  it { should be_valid }

  describe "when projectName is not present" do
    before { @project.projectName = " " }
    it { should_not be_valid }
  end
  
  describe "when projectName is too long" do
    before { @project.projectName = "a" * 50}
    it { should_not be_valid }
  end
  
  describe "when projectFile is not present" do
    before { @project.numberOfFiles = 0 }
    it { should_not be_valid }
  end
end
