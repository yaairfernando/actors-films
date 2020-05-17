class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification, msg, obj)
    html = ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification, msg: msg, obj: obj}, formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}", html: html
  end
end
