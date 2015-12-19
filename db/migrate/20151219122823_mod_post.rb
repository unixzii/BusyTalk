class ModPost < ActiveRecord::Migration
  def change
  	change_table :forum_posts do |t|
  		t.text :content
  		t.belongs_to :user
  	end
  end
end
