class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { in: 3..20 }
  validates :email, presence: true, uniqueness: true, format: /@/
  validates :password, length: { in: 6..72 }, confirmation: true

  has_many :actions
  has_many :activities
end
