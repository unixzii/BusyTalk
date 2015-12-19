class AddDescriptionToCategories < ActiveRecord::Migration
  def change
  	change_table :forum_categories do |t|
  		t.text :description
  	end
  end
end
