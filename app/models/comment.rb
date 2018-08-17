class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_commit -> { CommentRelayJob.perform_later(self) }
end
