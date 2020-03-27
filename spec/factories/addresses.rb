FactoryBot.define do

  factory :address do    
    family_name           {"遠藤"}
    first_name            {"健太"}
    family_name_kana      {"エンドウ"}
    first_name_kana       {"ケンタ"}
    tel                   {"00000000000"}
    prefecture_id        {"1"}
    municipality          {"大阪市"}
    address               {"中央区難波5丁目1−60"}
    building_name         {"なんばスカイオ15階"}
    zip_code              {"0000000"}
    user_id               {"1"}
  end

end
