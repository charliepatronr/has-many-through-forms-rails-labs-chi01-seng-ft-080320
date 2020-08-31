class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user

  def user_attributes=(users_attributes)
    if users_attributes[:username] != ''
      self.user = User.find_or_create_by(username: users_attributes[:username])
    end
  end
end
