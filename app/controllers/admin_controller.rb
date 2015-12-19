class AdminController < ApplicationController

	def add_category
		if not check_permission ['admin']
			flash[:last_msg] = '非法操作'
			render '/msg'
			return
		end

		category = ForumCategory.new

		category.title = params[:title]
		category.color = params[:color]
		category.description = params[:desc]
		category.admins = params[:admins]

		category.save

		flash[:last_msg] = '添加成功'
		render '/msg'
	end

	def public_post
		if not check_permission
			flash[:last_msg] = '非法操作'
			render '/msg'
			return
		end

		validate = true

		if not params[:c]
			validate = false
		end

		if not (params[:content] && params[:content].length > 0)
			validate = false
		end

		if not (params[:title] && params[:title].length > 0)
			validate = false
		end

		if validate
			flash[:last_msg] = '发布成功'

			post = ForumPost.new

			post.title = params[:title]
			post.content = params[:content]
			post.forum_category_id = params[:c]
			post.user_id = session[:current_user]

			post.save
		else
			flash[:last_msg] = '发布未成功，请稍候重试'
		end
		render '/msg'
	end

	def signup
		error = false
		msg = 0

		if User.find_by_username(params[:username])
			error = true
			msg = 1
		end

		if User.find_by_email(params[:email])
			error = true
			msg = 2
		end

		if not error
			user = User.new

			user.username = params[:username]
			user.password_digest = Digest::SHA2.hexdigest(params[:password])
			user.email = params[:email]

			user.save

			noti = Notification.new

			noti.user = user
			noti.content = '欢迎加入' + BusyTalk::Application.config.bbs_name + '，' + user.username + '。希望你在这里玩的开心 ^_^'

			noti.save
		end

		render :json => { :error => error, :msg => msg }
	end

	def login
		error = false

		if not User.find_by_username(params[:username])
			error = true
		end

		if not error
			user = User.find_by_username(params[:username])
			if user.password_digest != Digest::SHA2.hexdigest(params[:password])
				error = true
			else
				session[:current_user] = user.id
				if params[:remember]
					state = LoginState.find_by_username(user.username)
					if not state
						state = LoginState.new

						state.username = user.username
						state.secret = Digest::SHA2.hexdigest(user.username + user.password_digest + Time.new.to_s)

						state.save
					end
					cookies[:ls_secret] = { :value => state.secret, :expires => 1.month.from_now }
				end
			end
		end

		render :json => { :error => error }
	end

end