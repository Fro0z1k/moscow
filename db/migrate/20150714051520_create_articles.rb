class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url_title
      t.string :page_title
      t.string :article_title
      t.string :article_body
      t.string :source_url
      t.integer :article_source_id
      t.string :preview_url
      t.string :main_category_title, default: 'world'

      t.timestamps null: false
    end
  end
end
