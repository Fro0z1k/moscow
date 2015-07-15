class CategoryController < ApplicationController
  def show
    @category = Category.where( title: params[:title] ).first
  end

  private
  def category_params
    params.permit( :title )
  end
end
