class UserDecorator < Draper::Decorator
  delegate_all  

  decorates_association :reviews, scope: :recent
end
