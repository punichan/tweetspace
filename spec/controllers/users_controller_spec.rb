require 'rails_helper'
describe UsersController, type: :controller do

  describe 'GET #show' do
    it "show.hamlに遷移するか" do
      user = create(:user)
      get :show, params: {id: user}
      expect(response).to render_template :show
    end
    it "@userを取得できているかどうか" do
      user = create(:user)
      get :show, params: {id: user}
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "edit.hamlに遷移するか" do
      user = create(:user)
      get :show, params: {id: user}
      expect(response).to render_template :show
    end
  end

  describe 'GET #follows' do
    it "follows.hamlに遷移するか" do
      user = create(:user)
      get :show, params: {id: user}
      expect(response).to render_template :show
    end
  end

  describe 'GET #folloers' do
    it "followers.hamlに遷移するか" do
      user = create(:user)
      get :show, params: {id: user}
      expect(response).to render_template :show
    end
  end
end