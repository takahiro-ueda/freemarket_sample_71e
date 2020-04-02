FactoryBot.define do

  factory :item do    
    seller_id           {"1"}  #売り手
    buyer_id            {"2"}  #買い手
    size_id             {"1"}  #サイズ
    category_id         {"1"}  #カテゴリー
    status_id           {"1"}  #商品の状態
    brand               {"アップル"}  #ブランド
    name                {"iPhone11"}  #商品名
    introduction        {"色は黒です！状態も良いです！"}  #商品説明
    deal_closed_date    {"2020/3/31"}  #購買日
    price               {"50000"}  #価格
    value               {"1"}  #評価
    payer_id            {"1"}  #発送の負担
    delivery_id         {"1"}  #発送の方法
    duration_id         {"1"}  #発送までの日数
    prefecture_id       {"1"}  #発送元の地域
    trade_id            {"1"}  #取引の状態
  end

end