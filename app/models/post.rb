class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :postimage, PostimageUploader

  # draft(0): 下書き
  # published(1) : 通常状態
  # archived(-1) : 一覧に表示されなくなる（アーカイブ）
  enum status: {draft:0, published:1, archived:-1 }

  validates :title,  presence: true
  validates :content, presence: true
  validates :status, presence: true, inclusion: {in: Post.statuses.keys}

  # postimage の validation(size) は uploaders/postimage_uploader.rb
    # def size_range
    #   1..5.megabytes
    # end
  # で行う。数字を変更する場合はこれを変更する。
end
