class IndexController < ApplicationController
  def show
    @products = Product.all
    render :show
  end
end