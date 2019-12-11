require 'rails_helper'
describe Like do
  describe '#create' do
    it "tweetがなかったら登録できない" do
      like = build(:like, tweet_id:"")
      like.valid?
      expect(like.errors[:tweet_id]).to include("を入力してください")
    end

    it "user_idがなかったら登録できない" do
      like = build(:like, user_id:"")
      like.valid?
      expect(like.errors[:user_id]).to include("を入力してください")
    end

    it "created_atがなかったら登録できない" do
      like = build(:like, created_at:"")
      like.valid?
      expect(like.errors[:created_at]).to include("を入力してください")
    end

    it "updated_atがなかったら登録できない" do
      like = build(:like, updated_at:"")
      like.valid?
      expect(like.errors[:updated_at]).to include("を入力してください")
    end
  end
end