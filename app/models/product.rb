class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :description, :title, :price, :user_id, presence: true
  validates :price, numericality: true, format: { with: /\A\d+(\.\d{2})?\z/ }

  def average_rating
    all_ratings = self.reviews.map{ |e| e.rating }
    all_ratings.sum.to_f / all_ratings.size
  end
end
