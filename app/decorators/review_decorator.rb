class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
   if user.firstname.empty? || user.lastname.empty?
      user.email.split('@').first
    else
      "#{user.firstname} #{user.lastname}"
    end 
  end

  def created_at
    object.created_at.to_s(:long)
  end
end
