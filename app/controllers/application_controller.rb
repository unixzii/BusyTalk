class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def get_humanizer
  	YAML.load(File.open('./config/locales/humanizer.zh-CN.yml'))['zh-CN']['humanizer']['questions'];
  end

  def check_permission(*admins)
 		if not session[:current_user]
 			return false
 		end

 		if admins.count == 0
 			return true
 		end

		user = User.find(session[:current_user])

		if user
			if admins.include? user.username
				return true
			end
		end

		return false
	end

end
