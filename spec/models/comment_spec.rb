require 'rails_helper'
describe Comment do
  describe '#create' do
    it "commentがなかったら登録できない" do
      comment = build(:comment, comment:"")
      comment.valid?
      expect(comment.errors[:comment]).to include("を入力してください")
    end

    it "tweet_idがなかったら登録できない" do
      comment = build(:comment, tweet_id:"")
      comment.valid?
      expect(comment.errors[:tweet_id]).to include("を入力してください")
    end

    it "user_idがなかったら登録できない" do
      comment = build(:comment, user_id:"")
      comment.valid?
      expect(comment.errors[:user_id]).to include("を入力してください")
    end

    it "created_atがなかったら登録できない" do
      comment = build(:comment, created_at:"")
      comment.valid?
      expect(comment.errors[:created_at]).to include("を入力してください")
    end

    it "user_idがなかったら登録できない" do
      comment = build(:comment, updated_at:"")
      comment.valid?
      expect(comment.errors[:updated_at]).to include("を入力してください")
    end
  end
end

