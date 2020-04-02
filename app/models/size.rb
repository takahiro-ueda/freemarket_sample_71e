class Size < ActiveHash::Base
  self.data = [
      {id: 1, size: 'S'},{id: 2, size: 'M'},
      {id: 3, size: 'L'}
      # {id: 4, name: '24.5cm', category_id:},
      # {id: 5, name: '25.0cm', category_id:4,6},{id: 6, name: '25.5cm', category_id:},
      # {id: 6, name: 'サイス指定なし', category_id:},
  ]
end
