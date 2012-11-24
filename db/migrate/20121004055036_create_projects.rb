class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectName
      t.string :category

      t.timestamps
    end
  end
end
