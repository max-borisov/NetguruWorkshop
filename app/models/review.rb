class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content, :rating, :user_id, :product_id, presence: true
  validates :rating, :product_id, :user_id, numericality: { only_integer: true }, if: "errors.empty?"
end
