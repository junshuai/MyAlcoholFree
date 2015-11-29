class RenameColumnImageUrlInProductToThumbnailUrl < ActiveRecord::Migration
  def change
    rename_column :products, :image_url, :thumbnail_url
  end
end
