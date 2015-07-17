class MainController < ApplicationController
  def self.index
    @carusel = 10.times.map { | article | Category.first.articles.sample }
    @last_news = 3.times.map { | article | Category.first.articles.sample }
    @last_news_small = 3.times.map { | article | Category.first.articles.sample }
  end
end
