class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image
      t.string :title
      t.string :date
      t.string :description
      t.timestamps
    end
  end
end
