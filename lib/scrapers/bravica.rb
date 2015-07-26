module Scrapers::Bravica

  def self.get_article_links
    links = []
		site_url = "http://www.metronews.ru/news/moscow/"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		newslist.search( "div[@class='push-component clearfix  pushpub-1365   medium mt-article']" ).each do | par |
		  links << URI.parse( "http://www.metronews.ru" ).merge( par.at("a")["href"] ).to_s
		end
    newslist.search("div[@class='push-component clearfix  pushpub-1365   small mt-article']").each do | par |
		  links << URI.parse( "http://www.metronews.ru" ).merge( par.at("a")["href"] ).to_s
    end
    links
	end

  def self.get_article( link )
    sleep 60
    www = ScrapeUtils.new_mechanize
		article_page = www.get( link )
    images = []
    images << URI.parse( "http://metronews.ru" ).merge(article_page.at("div[@class='image-component large']/img")["src"]).to_s if article_page.at("div[@class='image-component large']/img")
    images << URI.parse( "http://metronews.ru" ).merge(article_page.at("div[@class='image-component x-large']/img")["src"]).to_s if article_page.at("div[@class='image-component x-large']/img")
		title = article_page.search( "div[@class='article-left-wrapper title-on-top']/h1" ).inner_text.strip if article_page.search( "div[@class='article-left-wrapper title-on-top']/h1" )
    title = article_page.search( "div[@class='article-top']/h1" ).inner_text.strip if article_page.search( "div[@class='article-top']/h1" )
    content = article_page.search( "div[@class='article-left-wrapper title-on-top']/div[@class='article-full-width']//div[@class='article-body']" ).inner_text if article_page.search( "div[@class='article-left-wrapper title-on-top']/div[@class='article-full-width']//div[@class='article-body']" )
    content = article_page.search( "div[@class='body-area']/div[@class='article-body']/p" ).inner_text.strip if article_page.search( "div[@class='body-area']/div[@class='article-body']/p" )
		return( { title: title, text: content, images: images } )
	end

end
