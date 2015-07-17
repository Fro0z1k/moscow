class MainController < ApplicationController
  def index

    @carusel = 10.times.map { | article | Category.first.articles.sample }
    @last_news = 3.times.map { | article | Category.first.articles.sample }
    @last_news_small = 3.times.map { | article | Category.first.articles.sample }

    @article_images_any = article.article_images.any?
    @true_article_images = article.article_images.first.image_url
    @not_image = 'http://paltelegraph.com/wp-content/uploads/2014/05/img_not_found.jpg'
  end
end
