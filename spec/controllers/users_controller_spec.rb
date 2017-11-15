require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "return all users" do
      User.destroy_all
      user1 = FactoryBot.create(:user)
      user2 = FactoryBot.create(:user)
      get :index
      users = assigns[:users]
      expect(users.size).to eq(2)
    end
  end

  describe "Post #Import" do
    it "Redirect to users_path" do
      path =  Rails.public_path.join('test.csv')
      params = { "file" => Rack::Test::UploadedFile.new(path, true) }

      post :import, params: params
      expect(response).to redirect_to(users_path)
      expect(response.status).to eq(302)
    end
  end

end
