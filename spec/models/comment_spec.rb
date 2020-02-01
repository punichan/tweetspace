require 'rails_helper'
describe Comment do
  describe '#create' do
    it "commentがなかったら登録できない" do
      comment = build(:comment, comment:"")
      comment.valid?
      expect(comment.errors[:comment]).to include("を入力してください")
    end

    it "200文字以上では登録できない" do
      comment = build(:comment, comment:"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      comeent.vaild?
      expect(comment.errors[:comment]).to include("200文字以内で入力してください")
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
  end
end

