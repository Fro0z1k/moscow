class CreateArticleSources < ActiveRecord::Migration
  def change
    create_table :article_sources do |t|
      t.string :url
      t.string :title
      t.string :vk_link
      t.string :xpath
      t.string :name

      t.timestamps null: false
    end
  end
end
