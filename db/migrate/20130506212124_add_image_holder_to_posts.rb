class AddImageHolderToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_holder, :text
  end
end
