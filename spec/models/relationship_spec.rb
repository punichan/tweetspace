require 'rails_helper'
describe Relationship do
  describe '#create' do
    it "created_atがなかったら登録できない" do
      relationship = build(:relationship, created_at:"")
      relationship.valid?
      expect(relationship.errors[:created_at]).to include("を入力してください")
    end

    it "updated_atがなかったら登録できない" do
      relationship = build(:relationship, updated_at:"")
      relationship.valid?
      expect(relationship.errors[:updated_at]).to include("を入力してください")
    end
  end
end