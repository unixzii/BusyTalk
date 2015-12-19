class MainController < ApplicationController

	def index
		ls_secret = cookies[:ls_secret]
		if ls_secret
			state = LoginState.find_by_secret(ls_secret)

			if state
				session[:current_user] = User.find_by_username(state.username).id
			else
				cookies[:ls_secret] = nil
			end
		end

		current_category = params[:c] || 1
		
		@current_page = (params[:page] || 1).to_i - 1

		@page_count = ForumPost.where('forum_category_id = ?', current_category).count / (8.0)
		@page_count = 1 if @page_count < 1

		@page_start = @current_page + 1 - 2
		@page_start = 1 if @page_start < 1
		@page_end = @page_start + 3
		@page_end = @page_count.ceil if @page_end > @page_count.ceil
		
		@posts = ForumPost.where('forum_category_id = ?', current_category).order(updated_at: :desc).limit(8).offset(@current_page * 8)
		@post_count = ForumPost.where('forum_category_id = ?', current_category).order(updated_at: :desc).count
		@today_post_count = ForumPost.where('TO_DAYS(NOW()) - TO_DAYS(`created_at`) <= 1 AND forum_category_id = ?', current_category).count
		@recent_active_posts = ForumPost.where('forum_category_id = ?', current_category).order(updated_at: :desc).limit(5)
		@category = ForumCategory.find(current_category)

		if @current_page + 1 < 1
			redirect_to '/?c=' + current_category.to_s
		end

		if @current_page + 1 > @page_count.ceil
			redirect_to '/?c=' + current_category.to_s + '&page=' + @page_count.ceil.to_s
		end
	end

	def categories
		@recent_post_dates = []

		ForumCategory.all.each do |i|
			post = ForumPost.where('forum_category_id = ?', i.id).order(created_at: :desc).first

			if post
				@recent_post_dates.push post[:created_at].strftime('%Y年%m月%d日 %H:%M')
			else
				@recent_post_dates.push '最近无新话题'
			end
		end
	end

	def public_post
		if not check_permission
			flash[:last_msg] = '您所在的用户组没有权限添加板块'
			render '/msg'
		end
	end

	def add_category
		if not check_permission ['admin']
			flash[:last_msg] = '您所在的用户组没有权限添加板块'
			render '/msg'
		end
	end

	def signup
	end

	def login
	end

	def logout
		if session[:current_user]
			user = User.find(session[:current_user])
			state = LoginState.find_by_username(user.username)
			if state
				state.destroy
				cookies[:ls_secret] = nil
			end
			session[:current_user] = nil

			flash[:last_msg] = '您已成功退出登录'
		else
			flash[:last_msg] = '非法操作'
		end

		render '/msg'
	end

end