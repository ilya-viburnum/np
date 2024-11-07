require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    let(:user) { build(:user) }

    it { expect(user).to be_valid }

    it "is invalid without a first name" do
      user.first_name = nil
      user.last_name = nil

      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("can't be blank")
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it "is invalid if the first name is too short" do
      user.first_name = ""
      user.last_name = ""

      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("is too short (minimum is 3 characters)")
      expect(user.errors[:last_name]).to include("is too short (minimum is 3 characters)")
    end

    it "is invalid if the first name is too long" do
      user.first_name = "F" * 51
      user.last_name = "L" * 51

      expect(user).not_to be_valid
      expect(user.errors[:first_name]).to include("is too long (maximum is 50 characters)")
      expect(user.errors[:last_name]).to include("is too long (maximum is 50 characters)")
    end
  end

  describe "#full_name" do
    let!(:user) { create(:user, first_name: "Harry", middle_name: "James", last_name: "Potter") }

    it "returns the full name correctly" do
      expect(user.full_name).to eq("Harry James Potter")
    end
  end
end
