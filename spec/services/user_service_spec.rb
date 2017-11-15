require 'rails_helper'

RSpec.describe UserService do

  describe "#list" do
    it "return all users" do
      User.destroy_all
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      users = UserService.list
      expect(users.size).to eq(2)
    end
  end

  describe "#import_csv" do
    it "Add users from csv" do
      file_path = Rails.public_path.join('test.csv')
      users = UserService.import_csv(file_path)

      expect(users[:added]).to eq(20)
      expect(users[:updated]).to eq(0)
      expect(users[:total]).to eq(20)
    end

    it "Update users from csv" do
      file_path = Rails.public_path.join('test.csv')
      users = UserService.import_csv(file_path)
      new_users_list = UserService.import_csv(file_path)

      expect(new_users_list[:added]).to eq(0)
      expect(new_users_list[:updated]).to eq(20)
      expect(new_users_list[:total]).to eq(20)
    end

  end

end