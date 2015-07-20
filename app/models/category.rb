class Category < ActiveRecord::Base

  has_many :category_articles
  has_many :articles, through: :category_articles

  scope :economy,                 -> { where( title: 'economy' ) }
  scope :urban_infrastructure,    -> { where( title: 'urban_infrastructure' ) }
  scope :architecture,            -> { where( title: 'architecture' ) }
  scope :public_service,          -> { where( title: 'public_service' ) }
  scope :realty,                  -> { where( title: 'realty' ) }
  scope :regional_infrastructure, -> { where( title: 'regional_infrastructure' ) }
  scope :tarifs,                  -> { where( title: 'tarifs' ) }
  scope :solution,                -> { where( title: 'solution' ) }
  scope :children,                -> { where( title: 'children' ) }
  scope :animals,                 -> { where( title: 'animals' ) }
  scope :selebrates,              -> { where( title: 'selebrates' ) }
  scope :funs,                    -> { where( title: 'funs' ) }
  scope :accident,                -> { where( title: 'accident' ) }
  scope :criminal,                -> { where( title: 'criminal' ) }
  scope :migrants,                -> { where( title: 'migrants' ) }
  scope :weather,                 -> { where( title: 'weather' ) }
  scope :transport,               -> { where( title: 'transport' ) }
  scope :subway,                  -> { where( title: 'subway' ) }
  scope :social_transport,        -> { where( title: 'social_transport' ) }
  scope :culture,                 -> { where( title: 'culture' ) }
  scope :politics,                -> { where( title: 'politics' ) }

  def self.header
    where( title: %w( economy tarifs solution accident weather transport culture politics ) )
  end

  # def self.economy
  #   where( title: %w( urban_infrastructure architecture public_service realty regional_infrastructure ) )
  # end

  # def self.solution
  #   where( title: %w( children animals selebrates funs ) )
  # end

  # def self.accident
  #   where( title: %w( criminal migrants ) )
  # end

  # def self.transport
  #   where( title: %w( subway social_transport ) )
  # end

  # def self.category_dropdown
  #   [ Category.economy, Category.solution, Category.accident, Category.transport ]
  # end
end
