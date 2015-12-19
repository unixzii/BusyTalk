class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
    	t.belongs_to :user
    	t.text :content
    	
    	t.timestamps
    end
  end
end
