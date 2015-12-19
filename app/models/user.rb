class User < ActiveRecord::Base
	has_many :forum_posts, dependent: :destroy
	has_many :forum_comments, dependent: :destroy
	has_many :forum_likes, dependent: :destroy
	has_many :notifications, dependent: :destroy
end