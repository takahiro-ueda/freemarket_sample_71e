class Delivery < ActiveHash::Base
  self.data = [
      {id: 1, name: 'らくらくフリマ便'}, {id: 2, name: 'ゆうゆうフリマ便'}, {id: 3, name: 'ゆうメール'},
      {id: 4, name: 'クロネコヤマト'},  {id: 5, name: 'ゆうパック'} 
  ]
end