module ApplicationHelper
	def get_nav_menus
		[
		  	{ :title => '讨论区', :link => '/', :action => 'index' },
		  	{ :title => '板块', :link => '/categories', :action => 'categories' },
		  	{ :title => '关于', :link => '/about', :action => 'about' }
		]
	end
end
