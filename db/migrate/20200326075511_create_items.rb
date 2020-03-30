class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :size, foreign_key: true, null: true
      t.references :category, foreign_key: true, null: false
      t.references :brand, foreign_key: true, null: true
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.string :status, null: false
      t.string :value, null: true
      t.string :shipping_payer, null: false
      t.string :delivery_method, null: false
      t.string :shipping_duration, null: false
      t.string :shipping_area, null: false
      t.date :deal_closed_date, null: true
      t.timestamps
    end
  end
end