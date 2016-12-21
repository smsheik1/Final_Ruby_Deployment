class Post < ApplicationRecord
  belongs_to :user
  belongs_to :like, class_name: 'User', optional:true
  has_many :LikedPost, :dependent => :delete_all
end
