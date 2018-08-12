class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # Called by e.g. <%= @product.comments.rating_desc.first %>
  scope :rating_desc, -> { order(rating: :desc) }
  # Called by e.g. <%= @product.comments.rating_asc.first %>
  scope :rating_asc, -> { order(rating: :asc) }
end
