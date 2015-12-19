class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
    	t.string :title
    	t.text :title, limit: 2097152
    	t.datetime :last_commented_at

    	t.belongs_to :forum_category
    	
    	t.timestamps
    end
  end
end
