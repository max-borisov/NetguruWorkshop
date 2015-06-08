module ProductsHelper
  def review_belongs_to_current_user?(review)
    current_user.id == review.user_id
  end

  def get_username_for_review(user)
    if user.firstname.empty? || user.lastname.empty?
      user.email.split('@').first
    else
      "#{user.firstname} #{user.lastname}"
    end
  end

  def product_has_reviews?(product)
    product.reviews.any?
  end
end