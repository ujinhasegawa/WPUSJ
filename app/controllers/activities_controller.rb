class ActivitiesController < ApplicationController

  def index
    @activity = current_user.activity.order('achieved_at desc')
  end

  def new
    if params[:activity].nil?
      @activity = Activity.new
      @disabled = false
    else
      id = params[:activity].to_i
      @activity = Activity.new(title: ActivityMaster.find(id).title, id: id)
      @disabled = true
    end
    @activity_master = ActivityMaster.all
  end

  def create
    params[:activity][:achieved_at] = params[:activity][:achieved_at].to_datetime
    id = params[:activity][:id]

    if not id.empty?
      if ActivityMaster.find(id).title == params[:activity][:title] # データが改ざんされていないかチェック
        params[:activity][:point] = ActivityMaster.find(id).point
        params[:activity][:group] = ActivityMaster.find(id).group
      else
        redirect_to :new_activity and return
      end
    end

    @activity = current_user.activity.new(activity_params)
    @activity.save

    if not @activity.point.nil?
      current_user.information.point_month    += @activity.point
      current_user.information.point_year     += @activity.point
      current_user.information.point_lifetime += @activity.point
      current_user.information.save
    end

    redirect_to :new_activity
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :memo, :point, :group, :achieved_at)
  end
end
