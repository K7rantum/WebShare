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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
