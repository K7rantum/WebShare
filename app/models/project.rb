class Project < ActiveRecord::Base
  attr_accessible :projectName,
                  :category,
                  :thumbnail,
                  :webOneUp,
                  :user_id
                  
#  attr_accessor :thumbnail_file_name
#  attr_accessor :thumbnail_content_type
#  attr_accessor :thumbnail_file_size
#  attr_accessor :thumbnail_updated_at
  
  attr_accessor :webOneUp_file_name
  attr_accessor :webOneUp_content_type
  attr_accessor :webOneUp_file_size
  attr_accessor :webOneUp_updated_at
  
  belongs_to :user

  has_attached_file :thumbnail,
		                :default_url => "/system/:attachment/:id/:style/:filename",
                    :styles => {
                    :normal => "200x200#",
                    :thumb  => "100x100#",
		                :small  => "75x75#" },
		                :default_style => :thumb,
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename",
                    :whiny_thumbnails => true
                    
  has_attached_file :webOneUp
  
  validates :projectName, :presence => true,
                          :length   => { :maximum => 30 }
  validates :thumbnail,   :presence => true
  
end
