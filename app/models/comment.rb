class Comment < ApplicationRecord
  belongs_to :post

  validates :commenter,  presence: true
  validates :comment, presence: true
end
