class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :podcast
  belongs_to :episode

  def username=(name)
    self.user = User.find_or_create_by(:name => name)
  end

  def username
    self.user.present? ? self.user.name : ""
  end

end