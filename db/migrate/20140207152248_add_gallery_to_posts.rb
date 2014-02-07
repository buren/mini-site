class AddGalleryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :gallery, :text
  end
end
