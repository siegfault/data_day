class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /@/

  has_many :actions
  has_many :activities
end
