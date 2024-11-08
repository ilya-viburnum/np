class Region < ApplicationRecord
  has_many :users
  has_many :posts

  validates :name, presence: true, uniqueness: true
end
