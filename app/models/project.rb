# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  projectName      :string(255)
#  category         :string(255)
#  numberOfFiles    :integer
#  numberOfLikes    :integer
#  numberOfComments :integer
#  thumbnailPath    :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Project < ActiveRecord::Base
  attr_accessible :category, :numberOfComments, :numberOfFiles, :numberOfLikes, :projectName, :thumbnailPath
end
