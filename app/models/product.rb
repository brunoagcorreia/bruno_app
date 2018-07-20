class Product < ApplicationRecord
  has_many :orders
  def self.search(search_term)
    if Rails.env.development?
      # Dev Mode (sqlite3)
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      # Production or test mode (PostgreSQL)
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end
end
