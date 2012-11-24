# == Schema Information
#
# Table name: projects
#
#  id                         :integer          not null, primary key
#  projectName                :string(255)
#  category                   :string(255)
#  numberOfFiles              :integer
#  numberOfLikes              :integer
#  numberOfComments           :integer
#  thumbnailPath              :string(255)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  projectFile_file_name      :string(255)
#  projectFile_content_type   :string(255)
#  projectFile_file_size      :integer
#  projectFile_updated_at     :datetime
#  thumbnailFile_file_name    :string(255)
#  thumbnailFile_content_type :string(255)
#  thumbnailFile_file_size    :integer
#  thumbnailFile_updated_at   :datetime
#  user_id                    :integer
#  thumbnail_file_name        :string(255)
#  thumbnail_content_type     :string(255)
#  thumbnail_file_size        :integer
#  thumbnail_updated_at       :datetime
#

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
    before { @project.projectName = "a" * 31}
    it { should_not be_valid }
  end
  
  describe "when project thumbnail is not present" do
    before { @project.thumbnail = 0 }
    it { should_not be_valid }
  end
end
