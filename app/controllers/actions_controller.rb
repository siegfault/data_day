class ActionsController < ApplicationController
  def index
    @actions = current_user.actions.preload(:activity).ordered.limit(5)
    @activities = current_activities.ordered
  end

  def create
    activity = current_user.activities.find(params[:activity_id])
    action = current_user.actions.new(activity: activity)
    if action.save && action.start
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
    action = current_user.actions.find(params[:action_id])
    if action.end
      redirect_to actions_path
    else
      flash[:error] = 'Could not be ended.'
      redirect_to actions_path
    end
  end

  private
  def update_params
    params.require(:act).permit(:start_at, :end_at)
  end
end

