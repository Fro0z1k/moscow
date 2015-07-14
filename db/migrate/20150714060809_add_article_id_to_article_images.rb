class AddArticleIdToArticleImages < ActiveRecord::Migration
  def change
    add_column :article_images, :article_id, :integer
  end
end
