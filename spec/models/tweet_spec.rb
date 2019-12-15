require 'rails_helper'
RSpec.describe Tweet, type: :model do
  describe '#create' do
    context 'can not save' do
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

    context 'can save' do
      it "tweetがあったら登録できる" do
        tweet = build(:tweet, image:"")
        
        tweet.valid?
        expect(tweet).to be_valid
        binding.pry
      end
      it "tweetとimageがあったら登録できる" do
        expect(build(:tweet)).to be_valid
      end
    end
  end
end

