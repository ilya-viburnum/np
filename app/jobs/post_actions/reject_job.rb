module PostActions
  class RejectJob < ApplicationJob
    queue_as :default

    def perform(post)
      post.reject!
    end
  end
end
