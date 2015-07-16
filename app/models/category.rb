class Category < ActiveRecord::Base
  default_scope { order(created_at: :asc) }
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: true
end
