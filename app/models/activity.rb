class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :actions

  validates :name, presence: true, uniqueness: { scope: :user_id }

  scope :ordered, -> { order("LOWER(activities.name)") }

  def total_length_of_time
    actions.complete.map(&:length).sum
  end

  def in_progress?
    actions.incomplete.any?
  end
end

