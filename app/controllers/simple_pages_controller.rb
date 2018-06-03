class SimplePagesController < ApplicationController
  def index
  end
end

class SimplePagesController < ApplicationController

  def landing_page
    @featured_product_1 = Product.first
    @featured_product_2 = Product.second
    @featured_product_3 = Product.last
  end
end
