class MainController < ApplicationController
  def index
    @not_image = 'http://paltelegraph.com/wp-content/uploads/2014/05/img_not_found.jpg'
    @carusel = Category.politics.first.articles.limit(4)
    @last_news = Category.politics.first.articles.limit(6)

  end
end
