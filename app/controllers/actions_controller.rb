class ActionsController < ApplicationController
  def index
  end

  def create
    activity = current_user.activities.find(params[:activity_id])
    action = current_user.actions.new(activity: activity, start_at: Time.now)
    if can_switch_action?(activity: activity, action: action)
      head :ok
    else
      render status: :bad_request
    end
  end

  def end
    if current_action.end
      head :ok
    else
      render status: :bad_request
    end
  end

  private
  def can_switch_action?(action:, activity:)
    if current_action
      current_action.activity != activity && current_action.end && action.save
    else
      action.save
    end
  end
end

