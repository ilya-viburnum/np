class Post < ApplicationRecord
  include AASM

  ALL_STATUSES = [
    DRAFT = "draft",
    ON_REVIEW = "on_review",
    APPROVED = "approved",
    REJECTED = "rejected"
  ]

  ADMIN_CREATE_STATUSES = [
    DRAFT = "draft",
    APPROVED = "approved"
  ]

  belongs_to :user
  belongs_to :region

  has_many_attached :images
  has_many_attached :files

  after_save :set_published_at, if: ->(record) { record.approved? && record.published_at.nil? }

  aasm column: "status" do
    state :draft, initial: true
    state :on_review
    state :rejected
    state :approved

    event :submit_review do
      transitions from: :draft, to: :on_review
    end

    event :approve do
      after do
        set_published_at
      end
      transitions from: [ :on_review, :draft ], to: :approved
    end

    event :reject do
      transitions from: :on_review, to: :rejected
    end
  end

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

  def image_urls
    images.map do |image|
      Rails.application.routes.url_helpers.url_for(image)
    end
  end

  def files_urls
    files.map do |image|
      Rails.application.routes.url_helpers.url_for(image)
    end
  end

  private

  def set_published_at
    update(published_at: DateTime.now)
  end
end
