class ModCategory < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.remove :forum_category_id
  	end

  	change_table :forum_categories do |t|
  		t.text :admins
  	end
  end
end
