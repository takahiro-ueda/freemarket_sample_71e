class Category < ActiveHash::Base
  self.data = [
    # {id: 1, name: 'メンズ', ancestry: NULL},       {id: 2, name: 'レディース', ancestry: NULL},
    # {id: 3, name: 'パンツ', ancestry: 1},          {id: 4, name: '靴', ancestry: 1},
    # {id: 5, name: 'トップス', ancestry: 2},        {id: 6, name: '靴', ancestry: 2},
    # {id: 7, name: 'ジーンズパンツ', ancestry: 1/3},  {id: 8, name: 'カーゴパンツ', ancestry: 1/3},
    # {id: 9, name: 'サンダル', ancestry: 1/6},       {id: 10, name: 'スニーカー', ancestry: 1/6},
    # {id: 11, name: 'アンサンブル', ancestry: 2/5},   {id: 12, name: 'ホルダーネック'2/5},
    # {id: 13, name: 'ハイヒール', ancestry: 2/6},    {id: 14, name: 'ローファー', ancestry: 2/6}

    {id: 1, name: 'メンズ', ancestry: nil}, {id: 2, name: 'パンツ', ancestry: 1},
    {id: 3, name: 'ジーンズパンツ', ancestry: 1/2}
  ]
end
