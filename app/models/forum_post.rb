class ForumPost < ActiveRecord::Base
	has_many :forum_comments, dependent: :destroy
	has_many :forum_likes, dependent: :destroy
	belongs_to :forum_category
	belongs_to :user
end