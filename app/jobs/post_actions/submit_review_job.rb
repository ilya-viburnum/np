module PostActions
  class SubmitReviewJob < ApplicationJob
    queue_as :default

    def perform(post)
      post.submit_review!
    end
  end
end
