class MainController < ApplicationController
  def index
    @not_image = 'http://paltelegraph.com/wp-content/uploads/2014/05/img_not_found.jpg'
    @carusel = 10.times.map { | article | Category.first.articles.sample }
    @last_news = 3.times.map { | article | Category.first.articles.sample }
    @last_news_small = 3.times.map { | article | Category.first.articles.sample }
  end
end
