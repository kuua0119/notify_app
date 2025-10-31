module ApplicationHelper
  def unchecked_notifications_count(user)
    user.passive_notifications.where(checked: false).count
  end
end
