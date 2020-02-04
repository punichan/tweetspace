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

      it "place_idがなかったら登録できない" do
        tweet = build(:tweet, place_id:"")
        tweet.valid?
        expect(tweet.errors[:place_id]).to include("を入力してください")
      end

      it "category_idがなかったら登録できない" do
        tweet = build(:tweet, category_id:"")
        tweet.valid?
        expect(tweet.errors[:category_id]).to include("を入力してください")
      end

      it "priceがなかったら登録できない" do
        tweet = build(:tweet, price:"")
        tweet.valid?
        expect(tweet.errors[:price]).to include("を入力してください")
      end

      it "foodがなかったら登録できない" do
        tweet = build(:tweet, food:"")
        tweet.valid?
        expect(tweet.errors[:food]).to include("を入力してください")
      end

      it "imageがなかったら登録できない" do
        tweet = build(:tweet, image:"")
        tweet.valid?
        expect(tweet.errors[:image]).to include("を入力してください")
      end

      it "storeがなかったら登録できない" do
        tweet = build(:tweet, store:"")
        tweet.valid?
        expect(tweet.errors[:store]).to include("を入力してください")
      end
    end

    context 'can save' do
      it "全てあれば登録できる" do
        tweet = build(:tweet)
        expect(tweet).to be_valid
      end
    end
  end
end


