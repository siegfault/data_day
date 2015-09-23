class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  scope :ordered, -> { order(start_at: :desc) }
  scope :complete, -> { where.not(end_at: nil) }
  scope :incomplete, -> { where(end_at: nil) }

  scope :ending_after,    ->(time) { where('end_at   > ?', DateTime.parse(time)) if time.present? }
  scope :ending_before,   ->(time) { where('end_at   < ?', DateTime.parse(time)) if time.present? }
  scope :starting_after,  ->(time) { where('start_at > ?', DateTime.parse(time)) if time.present? }
  scope :starting_before, ->(time) { where('start_at < ?', DateTime.parse(time)) if time.present? }

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

