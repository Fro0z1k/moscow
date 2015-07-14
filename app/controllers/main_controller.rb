class MainController < ApplicationController
  def index
    @last_news = []
    @articles = Article.all
    @images = ArticleImage.all
    @big_last_news_images = ArticleImage.all.limit(3)
    @small_last_news_images = ArticleImage.all.limit(3)

  end
end
