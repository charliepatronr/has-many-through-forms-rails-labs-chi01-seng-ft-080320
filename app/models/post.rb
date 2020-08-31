class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories



  def categories_attributes=(category_attributes)
    name = category_attributes["0"]["name"]
    if name != ""
      new_category = Category.find_or_create_by(name: name)
      self.categories << new_category
    end
  end


  # def post_comments=(comment)
  #     new_comment = Comment.new(content: comment.content)
  #     self.comments << new_comment
  # end

  # def post_comments 
  #   self.comments.map do |comment|
  #     comment.content
  #   end
  # end

  # def users_ids=(ids)
  #   ids.each do|id|
  #     user = User.find(id)
  #     self.users << user
  #   end
  # end

  # def users_ids 
  #   self.users.map do|user|
  #     user.id
  #   end
  # end

end
