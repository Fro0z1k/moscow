module Scrapers::Newsmsk
	
  def self.get_article_links
    links = []
		site_url = "http://www.newsmsk.com"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		newslist.search("td[@class='news_table_2']/div[@class='news_head']").each do | par |
			links << URI.parse( site_url ).merge( par.at("a")["href"] ).to_s
		end
		links
	end

  def self.get_article( link )
    www = ScrapeUtils.new_mechanize
		article_page = www.get( link )
    images = []
		images << URI.parse( "http://www.newsmsk.com" ).merge( article_page.at( "td[@class='new_rubric_list']//div[@class='image_holder']/img" )["src"] ).to_s if article_page.at( "td[@class='new_rubric_list']//div[@class='image_holder']/img" )
    images << URI.parse( "http://www.newsmsk.com" ).merge( article_page.at( "td[@class='new_rubric_list']//div[@class='image_link_holder']/img" )["src"] ).to_s if article_page.at( "td[@class='new_rubric_list']//div[@class='image_link_holder']/img" )
		title = article_page.search( "td[@class='new_rubric_list']//div[@class='news_head_inner']" ).inner_text.strip
    content = article_page.search( "td[@class='new_rubric_list']//div[@class='_ga1_on_']" ).inner_text.strip
		return( { title: title, text: content, images: images } )
	end

end
