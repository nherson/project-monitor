class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :group_number
      t.string :title
      t.string :github_shortname
    end
  end
end
