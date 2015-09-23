class ReportsController < ApplicationController
  def index
    @actions_grouped_by_activity = actions_from_params.group_by(&:activity)
    @total_activities_time = actions_from_params.map(&:length).sum || 0
    @timeline_data = actions_from_params.group_by{ |a| a.start_at.beginning_of_day.strftime("%b %e, %Y") }
  end

  private
  def actions_from_params
    @_actions_from_params ||= current_user.actions.
      ending_before(params[:ending_before]).
      starting_after(params[:starting_after]).
      complete.
      ordered.
      preload(:activity)
  end
end
