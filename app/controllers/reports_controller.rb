class ReportsController < ApplicationController
  def index
    @activities = current_activities.preload(:actions)
    @total_activities_time = @activities.map(&:total_length_of_time).sum || 0
    @timeline_data = current_user.actions.complete.ordered.group_by{ |a| a.start_at.beginning_of_day.strftime("%b %e, %Y") }
  end
end
