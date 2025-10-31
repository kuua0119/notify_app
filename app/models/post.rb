class Post < ApplicationRecord
  belongs_to :user

  def create_notification_comment!(current_user, comment)
    return if user_id == current_user.id # 自分の投稿なら通知不要
    Notification.create(
      visitor_id: current_user.id,
      visited_id: user_id,
      post_id: id,
      comment_id: comment.id,
      action: 'comment'
    )
  end

  def create_notification_like!(current_user)
    return if user_id == current_user.id
    Notification.create(
      visitor_id: current_user.id,
      visited_id: user_id,
      post_id: id,
      action: 'like'
    )
  end
end
