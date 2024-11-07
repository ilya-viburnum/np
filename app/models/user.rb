class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :role_users, dependent: :destroy
  has_many :roles, through: :role_users

  validates :first_name, :last_name, presence: true, length: { minimum: 3, maximum: 50 }

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def is_admin?
    roles.any? { |role| role.name == Role::ADMIN_ROLE_NAME }
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email encrypted_password first_name id id_value last_name middle_name remember_created_at reset_password_sent_at reset_password_token updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[role_users roles]
  end
end
