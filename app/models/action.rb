class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  scope :ordered, -> { order(start_at: :desc) }
  scope :completed, -> { where.not(end_at: nil) }
  scope :not_completed, -> { where(end_at: nil) }

  def name
    activity.name
  end

  def start
    update(start_at: Time.now)
  end

  def end
    update(end_at: Time.now)
  end

  def length
    if end_at
      end_at - start_at
    else
      Time.now - start_at
    end
  end
end

