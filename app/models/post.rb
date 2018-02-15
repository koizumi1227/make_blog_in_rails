class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :postimage, PostimageUploader


  validates :title,  presence: true
  validates :content, presence: true
  # postimage の validation(size) は uploaders/postimage_uploader.rb
    # def size_range
    #   1..5.Megabytes
    # end
  # で行う。数字を変更する場合はこれを変更する。
end
