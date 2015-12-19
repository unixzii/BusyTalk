class CreateLoginStates < ActiveRecord::Migration
  def change
    create_table :login_states do |t|
    	t.string :username
    	t.string :secret
    	
    	t.timestamps
    end
  end
end
