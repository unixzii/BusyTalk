class CreateForumCategories < ActiveRecord::Migration
  def change
    create_table :forum_categories do |t|
    	t.string :title
    	t.string :color
    end
  end
end
