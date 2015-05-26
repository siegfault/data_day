class ActivitiesController < ApplicationController
  def new
    @activity = current_user.activities.new
  end

  def create
    @activity = current_user.activities.new(create_params)
    if @activity.save
      redirect_to actions_path
    else
      render 'new'
    end
  end

  private
  def create_params
    params.require(:activity).permit(
      :name,
      :key_bind
    )
  end
end

