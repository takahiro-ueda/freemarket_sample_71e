class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.references :category, foreign_key: true, null: false
      t.string :size, null: false
      t.timestamps
    end
  end
end
