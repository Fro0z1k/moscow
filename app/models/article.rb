class Article < ActiveRecord::Base
  require 'mechanize'
  require 'rss'
  require 'open-uri'
  require 'rest-client'
  has_many :category_articles
  has_many :categories, through: :category_articles
  belongs_to :article_source
  has_many :article_image, dependent: :destroy
end
