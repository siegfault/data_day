class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  scope :ordered, -> { order(start_at: :asc) }
end

