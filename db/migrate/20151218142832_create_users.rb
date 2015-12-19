class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :password_digest
    	t.text :description
    	t.datetime :last_login_at

    	t.belongs_to :forum_category

    	t.timestamps
    end
  end
end
