class AddCopyrightToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :copyright, :string
  end
end
