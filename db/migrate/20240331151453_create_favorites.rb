class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:user_id, :micropost_id], unique: trues
  end
end
