class MainController < ApplicationController
  def index
    @not_image = 'http://paltelegraph.com/wp-content/uploads/2014/05/img_not_found.jpg'
    @carusel = 10.times.map { | article | Category.first.articles.sample }
    @last_news = 3.times.map { | article | Category.first.articles.sample }
    @last_news_small = 3.times.map { | article | Category.first.articles.sample }
    @header = 6.times.map { | article | Category.first.articles.sample }
    @popular_news = 3.times.map { | article | Category.last.articles.sample }
    @popular_small_news = 3.times.map { | article | Category.first.articles.sample }
    @popular_small_news_2 = 3.times.map { | article | Category.first.articles.sample }
    @bottom = Category.first.articles.limit( 6 )

    @economy =                  Category.find_by( title: 'economy' )
    @urban_infrastructure =     Category.find_by( title: 'urban_infrastructure' )
    @architecture =             Category.find_by( title: 'architecture' )
    @public_service =           Category.find_by( title: 'public_service' )
    @realty =                   Category.find_by( title: 'realty' )
    @regional_infrastructure =  Category.find_by( title: 'regional_infrastructure' )
    @tarifs =                   Category.find_by( title: 'tarifs' )
    @solution =                 Category.find_by( title: 'solution' )
    @children =                 Category.find_by( title: 'children' )
    @animals =                  Category.find_by( title: 'animals' )
    @selebrates =               Category.find_by( title: 'selebrates' )
    @funs =                     Category.find_by( title: 'funs' )
    @accident =                 Category.find_by( title: 'accident' )
    @criminal =                 Category.find_by( title: 'criminal' )
    @migrants =                 Category.find_by( title: 'migrants' )
    @weather =                  Category.find_by( title: 'weather' )
    @transport =                Category.find_by( title: 'transport' )
    @subway =                   Category.find_by( title: 'subway' )
    @social_transport =         Category.find_by( title: 'social_transport' )
    @culture =                  Category.find_by( title: 'culture' )
    @politics =                 Category.find_by( title: 'politics' )
  end
end
