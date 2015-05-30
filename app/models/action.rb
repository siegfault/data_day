class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  scope :ordered, -> { order(start_at: :desc) }
  
  def name
    activity.name
  end

  def end
    update(end_at: Time.now)
  end
end

