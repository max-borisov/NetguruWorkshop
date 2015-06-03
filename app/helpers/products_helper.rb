module ProductsHelper
  def review_belongs_to_current_user?(review)
    current_user.id == review.user_id
  end
end
