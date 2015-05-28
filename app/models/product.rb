class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :description, :title, :price, presence: true
  validates :price, numericality: true, format: { with: /\A\d{1}\.\d{1}\z/ }

  def average_rating
    all_ratings = self.reviews.map{ |e| e.rating }
    all_ratings.sum.to_f / all_ratings.size
  end
end
