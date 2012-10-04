class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectName
      t.string :category
      t.integer :numberOfFiles
      t.integer :numberOfLikes
      t.integer :numberOfComments
      t.string :thumbnailPath

      t.timestamps
    end
  end
end
