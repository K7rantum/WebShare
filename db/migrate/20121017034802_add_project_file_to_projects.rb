class AddImagesToTable < ActiveRecord::Migration
  def self.up
    add_column :projects, :projectFile_file_name, :string
    add_column :projects, :projectFile_content_type, :string
    add_column :projects, :projectFile_file_size, :integer
    add_column :projects, :projectFile_updated_at, :datetime
  end

  def self.down
    remove_column :projects, :projectFile_file_filename
    remove_column :projects, :projectFile_content_type
    remove_column :projects, :projectFile_file_size
    remove_column :projects, :projectFile_updated_at
  end
end
