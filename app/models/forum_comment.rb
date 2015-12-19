class ForumComment < ActiveRecord::Base
	has_many :forum_likes, dependent: :destroy
	belongs_to :forum_post
	belongs_to :forum_comment
end