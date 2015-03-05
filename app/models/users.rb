class User < ActiveRecord::Base

  has_many :user_podcasts
  has_many :podcasts, through: :user_podcasts

  def name
    @name = "#{first_name} #{last_name}"
  end

  #define a method to see if a user login is valid, i.e., exists already as a User and has the right password.

  # def valid?
  #   User.all.include?(self)
  # end

end