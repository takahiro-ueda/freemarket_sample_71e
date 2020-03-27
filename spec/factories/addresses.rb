FactoryBot.define do

  factory :address do    
    family_name           {"遠藤"}
    first_name            {"健太"}
    family_name_kana      {"エンドウ"}
    first_name_kana       {"ケンタ"}
    tel                   {"00000000000"}
    prefecture_id        {"1"}
    municipality          {"浅口市金光町"}
    address               {"大谷１９４４"}
    building_name         {"フジハイツ"}
    zip_code              {"7190111"}
    user_id               {"1"}
  end

end
