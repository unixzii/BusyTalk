class CreateForumComments < ActiveRecord::Migration
  def change
    create_table :forum_comments do |t|
    	t.text :content

    	t.belongs_to :forum_post
    	t.belongs_to :forum_comment
    end
  end
end
