class User < ActiveRecord::Base
  include BCrypt


  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: {message: "Password can't be blank"}

  has_secure_password

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end

end
