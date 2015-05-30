class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :actions

  AVAILABLE_KEYBINDS = %w(a b)

  validates :key_bind, inclusion: { in: AVAILABLE_KEYBINDS }, presence: true, uniqueness: true

  def total_length_of_time
    actions.completed.map(&:length).sum
  end
end

