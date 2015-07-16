class Product < ActiveRecord::Base
  default_scope { order(created_at: :asc) }
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :description, :title, :price, :user_id, presence: true
  validates :price, numericality: true, format: { with: /\A\d+(\.\d{0,2})?\z/ }

  has_attached_file :preview, styles: { medium: "300x300>", thumb: "200x200>", tiny: "100x100>" }, :default_url => ":style.png"
  validates_attachment_content_type :preview, :content_type => /\Aimage\/.*\Z/

  def average_rating
    all_ratings = self.reviews.map{ |e| e.rating }
    all_ratings.sum.to_f / all_ratings.size
  end

  def has_reviews?
    reviews.any?
  end

  def belongs_to_user?(user)
    user.id == self.user.id
  end
end
