require 'rails_helper'
describe TweetsController , type: :controller do
  let(:tweet) {create(:tweet)}
  let(:user) { create(:user) }
  
  describe '#index' do
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

  describe '#new' do
    context 'log in' do
      before do
        login user 
        get :new
      end
      it "new.hamlに遷移するか" do
        get :new
        expect(response).to render_template :new
      end 
    end
    context 'not log in' do
      before do
        get :new
      end
      it "ログイン画面に遷移するのか" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  describe '#show' do
  
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

  describe '#edit' do
    context 'log in' do
      before do
        login user 
        get :edit, params: {id: tweet}
      end
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

    context 'not log in' do
      before do
        get :edit, params: {id: tweet}
      end
      it "ログイン画面に遷移するのか" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '#create' do
  let(:params){{user_id: user.id, tweet: attributes_for(:tweet)}}
    context 'log in' do
      before do
        login user
      end
        context 'can save' do
          subject{
            post :create,
            params: params
          }
          it "tweetができたかどうか" do
            expect{ subject }.to change(Tweet, :count).by(1)
          end
        end
    
        context 'can not save' do
        end
    end
    context 'not log in' do
    end
  end
end