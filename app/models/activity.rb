class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :actions

  validates :key_bind, inclusion: { in: 'a'.upto('z').to_a }, presence: true, uniqueness: { scope: :user_id }

  def total_length_of_time
    actions.completed.map(&:length).sum
  end
end

