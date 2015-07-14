class ArticleController < ApplicationController
  def show
    @image = ArticleImage.find( 1 )
    @article = Article.find( @image.article_id )
  end
end
