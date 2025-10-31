class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit :create_notification_like

  private

  def create_notification_like
    post.create_notification_like!(user)
  end
end
