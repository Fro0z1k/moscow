module ContentEngine
  class << self

    def start
      Article.delete_all
      puts '!!! >>>> ARTICLES DELETE <<<< !!!'
      get_all_articles
    end


    def get_all_articles
    	scraper_names = %w|kp moskva_bezformata mk interfax tass vm rosbalt bravica regnews|
    	scraper_names.each do | n | get_articles n end
    end

		def get_articles( scraper_name )
      scraper = Scrapers.const_get( scraper_name.camelize )
			article_source = ArticleSource.where( name: scraper_name ).first || ArticleSource.new( name: scraper_name )
			article_source.save! if article_source.new_record?
			article_links = scraper.get_article_links
			article_links.each do | link |
        next if article_source.articles.where( source_url: link ).first
				article_data = scraper.get_article( link )
				article = article_source.articles.build( article_title: article_data[:title], article_body: article_data[:text], source_url: link )
				( article_data[:images] || [] ).each do | image_link |
				  image = article.article_images.build( image_url: image_link )
				end
				article.save if article.article_images.any?
			end
      delete_all_category_articles
		end

    def delete_all_category_articles
      Category.all.map.each { | category | category.articles.delete_all }
      add_category_articles
    end

    def add_category_articles
      Category.all.map do | category |
        article = Article.all.sample
        category.articles << article.article_source.articles
      end
    end

  end
end
