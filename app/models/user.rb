class User < ActiveRecord::Base
  # has_many :questions
  has_many :answers
  validates :first_name, presence: true
  validates :last_name, presence: true

end
