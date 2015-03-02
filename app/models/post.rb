class Post < ActiveRecord::Base
  belongs_to :author

  def author_name=(name)
    self.author = Author.find_or_create_by(:name => name)
  end

  def author_name
    self.author.present? ? self.author.name : ""
  end
end