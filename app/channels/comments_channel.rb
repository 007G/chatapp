class CommentsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "comment:#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
