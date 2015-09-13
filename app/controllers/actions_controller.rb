class ActionsController < ApplicationController
  def index
    @actions = current_user.actions.preload(:activity).ordered.limit(5)
  end

  def create
    activity = current_user.activities.find(params[:activity_id])
    action = current_user.actions.new(activity: activity)
    if can_switch_action?(activity: activity, action: action)
      redirect_to actions_path
    else
      flash[:error] = 'Could not be started.'
      redirect_to actions_path
    end
  end

  def edit
    @action = current_user.actions.find(params[:id])
  end

  def update
    current_user.actions.find(params[:id]).update(update_params)
    redirect_to actions_path
  end

  def destroy
    if current_user.actions.find(params[:id]).destroy
      redirect_to actions_path
    else
      flash[:error] = 'Could not be destroyed.'
      redirect_to actions_path
    end
  end

  def end
    if current_action.end
      redirect_to actions_path
    else
      flash[:error] = 'Could not be ended.'
      redirect_to actions_path
    end
  end

  private
  def can_switch_action?(action:, activity:)
    if current_action
      current_action.activity != activity && current_action.end && action.start
    else
      action.start
    end
  end

  def update_params
    params.require(:act).permit(:start_at, :end_at)
  end
end

