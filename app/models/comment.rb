class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # Called by e.g. <%= @product.comments.rating_desc.first %>
  scope :rating_desc, -> { order(rating: :desc) }
  # Called by e.g. <%= @product.comments.rating_asc.first %>
  scope :rating_asc, -> { order(rating: :asc) }

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }


end
