class CreateDbLocks < ActiveRecord::Migration
  def change
    create_table :db_locks do |t|
    	t.string :db_name
    end
  end
end
