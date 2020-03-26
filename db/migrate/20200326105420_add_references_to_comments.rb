class AddReferencesToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :item, foreign_key: { to_table: :items }, null: false
    add_reference :comments, :user, foreign_key: { to_table: :users }, null: false
  end
end
