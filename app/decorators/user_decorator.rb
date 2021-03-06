class UserDecorator < Draper::Decorator
  delegate_all

  decorates_association :reviews, scope: :recent

  def created_at
    object.created_at.to_formatted_s(:long)
  end
end
