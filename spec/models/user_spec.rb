require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "validations" do
    it "has a valid factory" do
      user = build :user
      expect(user).to be_valid
    end
    it "is invalid without a first name" do
      user = build :user, first_name: nil
      expect(user).to be_invalid
    end
    it "is invalid with a single character first name" do
      user = build :user, first_name: 'G'
      expect(user).to be_invalid
    end
    it "is invalid with a 51 character first name" do
      user = build :user, first_name: ("S" * 51)
      expect(user).to be_invalid
    end
    it "is invalid without a last name" do
      user = build :user, last_name: nil
      expect(user).to be_invalid
    end
    it "is invalid with a single character last name" do
      user = build :user, last_name: 'G'
      expect(user).to be_invalid
    end
    it "is invalid with a 51 character last name" do
      user = build :user, last_name: ("S" * 51)
      expect(user).to be_invalid
    end
    it "is invalid without an email" do
      user = build :user, email: nil
      expect(user).to be_invalid
    end
    it "is invalid with a duplicate email" do
      saved_user = build :user, email: "same@example.com"
      saved_user.skip_confirmation!
      saved_user.save!
      user = build :user, email: "same@example.com"
      expect(user).to be_invalid
    end
    it "has a default value for role attribute" do
      user = User.new
      expect(user.role).not_to be_nil
    end
    it "is invalid with an undeclared role" do
      user = build :user, role: "dictator"
      expect(user).to be_invalid
    end
  end

  describe "class methods" do
    it "responds to the `roles` method with an Array" do
      expect(User.roles).to be_instance_of Array
    end
  end

  describe "instance methods" do
    it "returns a full name" do
      user = build :user, first_name: 'Ford', last_name: 'Prefect'
      expect(user.full_name).to eq("Ford Prefect")
    end
  end
  
end
