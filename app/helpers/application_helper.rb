module ApplicationHelper
  def full_title(page_title ='')
    title_name = '自力ブログ作成'
    if page_title.empty?
      title_name
    else
      page_title + " " + title_name
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
