class RoleUser < ApplicationRecord
  belongs_to :role
  belongs_to :user

  validates :role_id, uniqueness: { scope: :user_id }

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id id_value role_id updated_at user_id]
  end
end
