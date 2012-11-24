class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectName
      t.string :category
      t.integer :numberOfFiles
      t.integer :numberOfLikes
      t.integer :numberOfComments

      t.timestamps
    end
  end
end
