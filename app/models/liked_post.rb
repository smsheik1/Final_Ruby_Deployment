class LikedPost < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :liker, class_name: 'User'
end
