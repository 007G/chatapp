require 'test_helper'

class CommentRelayJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end
  queue_as :default

  def perform(notification)
    html = ApplicationController.render partial: "comments/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
    ActionCable.server.broadcast "comments:#{notification.recipient_id}", html: html
  end

end
