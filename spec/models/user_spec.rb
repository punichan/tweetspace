require 'rails_helper'
describe User do
  describe '#create' do
    it "nameがなかったら登録できない" do
      user = build(:user, name:"")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
  end
end

