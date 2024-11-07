require "rails_helper"

RSpec.describe Role, type: :model do
  let(:role) { build(:role) }

  describe "#validations" do
    it { expect(role).to be_valid }

    it "is invalid without a name" do
      role.name = ""
      expect(role).not_to be_valid
      expect(role.errors[:name]).to include("can't be blank")
    end

    it "does not allow duplicate names (case insensitive)" do
      create(:role, name: "admin")
      duplicated_role = build(:role, name: "admin")
      expect(duplicated_role).not_to be_valid
      expect(duplicated_role.errors[:name]).to include("has already been taken")
    end
  end

  describe "#callbacks" do
    it "converts name to snake_case before validation" do
      role.name = "Admin Role"
      role.valid?
      expect(role.name).to eq("admin_role")
    end
  end
end
