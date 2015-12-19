class CreateForumLikes < ActiveRecord::Migration
  def change
    create_table :forum_likes do |t|
    	t.integer :type

    	t.belongs_to :user
    	t.belongs_to :forum_post
    	t.belongs_to :forum_comment
    end
  end
end
