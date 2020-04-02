class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # activehashを適用する為一時的に外します↓
      # t.references :size, foreign_key: true, null: true
      # t.references :category, foreign_key: true, null: false
      t.integer :category_id, null: false
      t.integer :size_id, null: false
      t.string :name, null: false
      t.string :introduction, null: false
      t.string :brand, null: true
      t.integer :price, null: false
      t.integer :status_id, null: false
      t.string :value, null: true
      t.integer :trade_id, null: false
      t.integer :payer_id, null: false
      t.integer :delivery_id, null: false
      t.integer :duration_id, null: false
      t.integer :prefecture_id, null: false
      t.date :deal_closed_date, null: true
      t.timestamps
    end
  end
end