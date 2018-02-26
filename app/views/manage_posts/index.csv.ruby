require 'csv'

CSV.generate do |csv|
  csv << ["#{@user.username} 投稿一覧"]
  csv << []
  csv_colomuns_name = ["タイトル", "内容", "状態"]
  csv << csv_colomuns_name
  @user_post_csv.each do |post|
    csv_colomuns_values = [
      post.title,
      post.content,
      post.status
    ]
    csv << csv_colomuns_values
  end
end
