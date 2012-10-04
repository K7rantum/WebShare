class Project < ActiveRecord::Base
  attr_accessible :category, :numberOfComments, :numberOfFiles, :numberOfLikes, :projectName, :thumbnailPath
end
