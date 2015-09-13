class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :actions

  validates :name, presence: true, uniqueness: { scope: :user_id }

  def total_length_of_time
    actions.completed.map(&:length).sum
  end

  def percent_of(total:, precision: 2)
    if total > 0
      total_length_of_time.to_f * 100 / total
    else
      0
    end.round(precision)
  end

  def in_progress?
    actions.not_completed.any?
  end
end

