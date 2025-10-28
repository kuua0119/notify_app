class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create_commit :create_notification_comment

  private

  def create_notification_comment
    post.create_notification_comment!(user, self)
  end
end
