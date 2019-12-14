require 'rails_helper'
describe TweetsController do
  
  describe 'GET #index' do
    it "最新10件のツイートを取得できているかどうか" do
      tweets = create_list(:tweet, 10) 
      get :index
      expect(assigns(:tweets)).to match(tweets.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    it "最新10件の新規登録者を取得できるかどうか" do
      users = create_list(:user, 10)
      get :index
      expect(assigns(:users)).to match(users.sort{ |a, b| b.created_at <=> a.created_at})
    end
    it "index.hamlに遷移するか" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it "new.hamlに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "@tweetが期待した値か" do
      tweet = create(:tweet)
      get :show, params: {id: tweet}
      expect(assigns(:tweet)).to eq tweet
    end
    it "show.hamlに遷移するか"do
      tweet = create(:tweet)
      get :show, params: { id: tweet }
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    it "@tweetが期待した値か" do
      tweet = create(:tweet)
      get :edit, params: {id: tweet}
      expect(assigns(:tweet)).to eq tweet
    end

    it "edit.hamlに遷移するか" do
      tweet = create(:tweet)
      get :edit, params: { id: tweet }
      expect(response).to render_template :edit
    end
  end
end