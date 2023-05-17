class DeadlineNotificationJob < ApplicationJob
  queue_as :default

  def perform(task)
    # Access the task and user associated with the task
    user = task.user

    # Implement the notification logic here
    # For example, you could use a notification library or API to send the notification

    # Example: Use a notification library
    notification = NotificationService.new
    notification.send_notification(user, "Task #{task.title} is due soon!")

    # Example: Use an external API
    ExternalNotificationAPI.send_notification(user.email, "Task #{task.title} is due soon!")
  end
end
