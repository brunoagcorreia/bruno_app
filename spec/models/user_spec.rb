require 'rails_helper'


describe User do
  #validation test. A valid user demands email and password - other fields are optional
  context "user validation" do
    # let(:user) { User.create!(first_name: "John", email: "test@gmail.com", password: "xxx_xx") }

    it "is expected to be invalid" do
      expect(User.new(
        email: "test@gmail.com",
        password: nil)
      ).not_to be_valid
    end

    it "needs email and password" do
      expect(User.new(
        email: "aa@aa.com",
        password: "xxx_xx")
      ).to be_valid
    end

    it "is invalid without email" do
      @user = FactoryBot.build(:random_user, email: nil)
      expect(@user).not_to be_valid
    end

  end
end
