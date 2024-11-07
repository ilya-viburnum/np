class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true, length: { minimum: 3, maximum: 50 }

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
