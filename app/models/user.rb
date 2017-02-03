class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: /@/

  has_many :actions, dependent: :destroy
  has_many :activities, dependent: :destroy
end
