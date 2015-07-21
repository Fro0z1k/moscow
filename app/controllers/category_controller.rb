class CategoryController < ApplicationController
  def show
    @category = Category.find_by( title: params[:title] )
    @header = 6.times.map { | article | Category.first.articles.sample }
    @footer = 3.times.map { | article | Article.all.sample }
    @news = 10.times.map { | article | Category.first.articles.sample }
    @small_news = 6.times.map { | article | Category.last.articles.sample }


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

  private
  def category_params
    params.permit( :title )
  end
end
