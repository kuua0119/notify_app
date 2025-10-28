class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(visited_id: params[:user_id])
    @notifications.where(checked: false).update_all(checked: true)
  end
end
