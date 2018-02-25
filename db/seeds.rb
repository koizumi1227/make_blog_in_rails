require 'faker'
user = User.new(username: "sampleuser",
                email: "sample@example.com",
                password:              "111111",
                password_confirmation: "111111",
                confirmed_at: DateTime.now
                )
user.skip_confirmation!
user.save!

5.times do |n|
  name  = "sampleuser#{n+1}"
  email = "sample#{n+1}@example.com"
  password = "password"
  user = User.new(username: name,
                  email: email,
                  password:              password,
                  password_confirmation: password,
                  confirmed_at: DateTime.now
                  )
  user.skip_confirmation!
  user.save!
end

users = User.order(:created_at).take(3)
5.times do
  title = Faker::Lorem.sentence(5)
  content = Faker::Lorem.paragraphs(5)
  postimage_published =  File.open(File.join(Rails.root, "test/image/sampleimage.jpg"))
  postimage_archived =  File.open(File.join(Rails.root, "test/image/sampleimage_2.jpg"))
  users.each do |user|
  # draft
  post_1 = user.posts.new(title: title,
                  content: content,
                  status: 0
                )
  post_1.save!
  # published
  post_2 = user.posts.new(title: title,
                  content: content,
                  postimage: postimage_published,
                  status: 1
                )
  post_2.save!
  # archived
  post_3 = user.posts.new(title: title,
                  content: content,
                  postimage: postimage_archived,
                  status: -1
                )
  post_3.save!
  end
end

# 投稿一覧をだしたときに降順のため、最新の記事からコメント表示
last_post = Post.last.id
10.times do |n|
  2.times do
    commenter = Faker::Name.first_name
    comment = Faker::Lorem.sentence(2)
    post_id = "#{last_post - n}"
    comments = Comment.new(commenter: commenter,
                            comment: comment,
                            post_id: post_id)
    comments.save!
  end
end
