module Scrapers::Regnews
	
  def self.get_article_links
    links = []
		site_url = "http://regnews.ru/moskva/"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		newslist.search( "div[@class='post']/div[@class='post_title mgs_marb_15 font_size_22 normline']" ).each do | par |
			links << URI.parse( "http://regnews.ru/" ).merge( par.at("a")["href"] ).to_s if links.count < 6
		end
		links
	end

  def self.get_article( link )
    www = ScrapeUtils.new_mechanize
		article_page = www.get( link )
    images = []
		images << URI.parse( "http://regnews.ru" ).merge( article_page.at( "div[@class='mgs_marb_10 disimg']/img" )["src"] ).to_s
		title = article_page.search( "div[@class='mgs_colm3']/h1" ).inner_text.strip
    content = article_page.search( "div[@class='mgs_colm3']/p" )[0..4].inner_text.strip
		return( { title: title, text: content, images: images } )
	end

end
