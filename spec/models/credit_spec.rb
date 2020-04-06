require 'rails_helper'

describe Credit do
  describe '#create' do
    it "is invalid without customer_id" do
    credit = build(:credit, customer_id: nil)
    credit.valid?
    expect(credit.errors[:customer_id]).to include("を入力してください")
    # エラー文が日本語表記になっている。デフォルトは英語で『can’t be blank』
    end
    end
    describe '#create' do
    it "is invalid without user" do
    credit = build(:credit, user_id:nil)
    credit.valid?
    expect(credit.errors[:user_id]).to include("を入力してください")
    end
    end
    describe '#create' do
    it "is valid with a user_id, customer_id" do
    card = build(:credit)
    expect(card).to be_valid
    end
  end
end
