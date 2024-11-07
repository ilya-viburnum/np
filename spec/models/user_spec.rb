require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user, first_name: "Harry", middle_name: "James", last_name: "Potter") }
  let(:admin_user) { create(:user, :admin) }

  describe "validations" do
    it { expect(user).to be_valid }

    it "is invalid without a first and last names" do
      user.first_name = nil
      user.last_name = nil

      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid if the first and last names is too short" do
      user.first_name = ""
      user.last_name = ""

      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("is too short (minimum is 3 characters)")
      expect(user.errors[:last_name]).to include("is too short (minimum is 3 characters)")
    end

    it "is invalid if the first and last names are too long" do
      user.first_name = "F" * 51
      user.last_name = "L" * 51

      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("is too long (maximum is 50 characters)")
      expect(user.errors[:last_name]).to include("is too long (maximum is 50 characters)")
    end
  end

  describe "#full_name" do
    it { expect(user.full_name).to eq("Harry James Potter") }
  end

  describe "#is_admin?" do
    it { expect(admin_user.is_admin?).to eq(true) }
    it { expect(user.is_admin?).to eq(false) }
  end
end
