require 'rails_helper'
describe Tweet do
  describe '#create' do
    it "tweetがなかったら登録できない" do
      tweet = build(:tweet, tweet:"")
      tweet.valid?
      expect(tweet.errors[:tweet]).to include("を入力してください")
    end

    it "user_idがなかったら登録できない" do
      tweet = build(:tweet, user_id:"")
      tweet.valid?
      expect(tweet.errors[:user_id]).to include("を入力してください")
    end

  end
end

