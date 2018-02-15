class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :postimage, PostimageUploader


  validates :title,  presence: true
  validates :content, presence: true
end
