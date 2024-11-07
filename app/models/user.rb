class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true, length: { minimum: 3, maximum: 50 }

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email encrypted_password first_name id id_value last_name middle_name remember_created_at reset_password_sent_at reset_password_token updated_at]
  end
end
