class Post < ApplicationRecord
  belongs_to :user
  belongs_to :region

  STATUSES = [
    DRAFT = "draft",
    ON_REVIEW = "on_review",
    APPROVED = "approved",
    REJECTED = "rejected",
  ]

  has_many_attached :images
  has_many_attached :files

  enum status: { draft: DRAFT, on_review: ON_REVIEW, approved: APPROVED, rejected: REJECTED }

  validates :title, presence: true
  validates :body, presence: true

  scope :draft, -> { where(status: DRAFT) }
  scope :on_review, -> { where(status: ON_REVIEW) }
  scope :approved, -> { where(status: APPROVED) }
  scope :rejected, -> { where(status: REJECTED) }

  def self.ransackable_attributes(auth_object = nil)
    %w[published_at region_id status user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[region user]
  end
end
