class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.numeric :rating
      t.string :omdbid
      t.string :comment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
