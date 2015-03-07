class User < ActiveRecord::Base

  has_many :user_podcasts
  has_many :podcasts, through: :user_podcasts
  has_many :posts

  def name
    @name = "#{first_name} #{last_name}"
  end

end