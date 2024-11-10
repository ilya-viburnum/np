module PostActions
  class ApproveJob < ApplicationJob
    queue_as :default

    def perform(post)
      post.approve!
    end
  end
end
