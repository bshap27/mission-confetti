class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags, through: :post_tags
  has_many :post_tags

  def username=(name)
    self.user = User.find_or_create_by(:name => name)
  end

  def username
    self.user.present? ? self.user.name : ""
  end

end