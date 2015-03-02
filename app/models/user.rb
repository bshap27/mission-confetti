class User < ActiveRecord::Base

  #define a method to see if a user login is valid, i.e., exists already as a User and has the right password.

  # def valid?
  #   User.all.include?(self)
  # end

end