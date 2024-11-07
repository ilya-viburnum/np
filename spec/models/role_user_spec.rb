require "rails_helper"

RSpec.describe RoleUser, type: :model do
  let(:role_user) { build(:role_user) }

  describe "#validations" do
    it { expect(role_user).to be_valid }

    it "is invalid without a role and user" do
      role_user.role = nil
      role_user.user = nil

      expect(role_user).not_to be_valid
      expect(role_user.errors[:role]).to include("must exist")
      expect(role_user.errors[:user]).to include("must exist")
    end

    it "validates uniqueness of role_id scoped to user_id" do
      role_user = create(:role_user)
      duplicated_role_user = build(:role_user, role: role_user.role, user: role_user.user)
      expect(duplicated_role_user).not_to be_valid
      expect(duplicated_role_user.errors[:role_id]).to include("has already been taken")
    end
  end
end
