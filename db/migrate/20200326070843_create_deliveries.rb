class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :method, null: false
      t.string :burden, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
