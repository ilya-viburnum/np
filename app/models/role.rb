class Role < ApplicationRecord
  has_many :role_users, dependent: :destroy
  has_many :users, through: :role_users

  before_validation :set_name_camel_case

  validates :name, presence: true, uniqueness: { case_sensitive: false, allow_blank: true }

  private

  def set_name_camel_case
    self.name = name.parameterize(separator: "_")
  end
end
