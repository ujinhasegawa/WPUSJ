class ActivitiesController < ApplicationController

  def new
    @activity        = Activity.new
    @activity_master = ActivityMaster.all
  end

  def create
    params[:activity][:achieve_at] = params[:activity][:achieve_at].to_datetime
    @activity = current_user.activity.new(activity_params)
    @activity.save
    redirect_to :root
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :memo, :achieve_at)
  end
end
