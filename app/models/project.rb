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
  attr_accessible :projectName, :category, 
                  :numberOfComments, :numberOfFiles, :numberOfLikes,
                  :projectFile, :projectThumbnail, :thumbnailPath, :user_id
                  
  attr_accessor :projectThumbnail_file_name
  attr_accessor :projectThumbnail_content_type
  attr_accessor :projectThumbnail_file_size
  attr_accessor :projectThumbnail_updated_at
  
  belongs_to :user

  has_attached_file :projectFile
  has_attached_file :projectThumbnail,
		                :default_url => "/system/:attachment/:id/:style/:filename",
                    :styles => {
                    :normal => "200x200#",
                    :thumb  => "100x100#",
		                :small  => "75x75#" },
		                :default_style => :thumb,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename",
                    :whiny_thumbnails => true
  
  validates :projectName,   :presence => true
  validates :numberOfFiles, :presence => true
  validates :projectFile,   :presence => true
  
end
