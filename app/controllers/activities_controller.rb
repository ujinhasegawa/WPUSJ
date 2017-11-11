class ActivitiesController < ApplicationController

  def index
    activity  = current_user.activity
    @activity = activity.order('achieved_at desc')
    @summary  = activity.group(:title).count

    @summary_each_year  = current_user.summarize_activities_each_year
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
      user_info = current_user.information
      user_info.point_month    += @activity.point
      user_info.point_year     += @activity.point
      user_info.point_lifetime += @activity.point

      groups = Activity.groups.keys
      case @activity.group
      when groups[0]
        user_info.point_bible            += @activity.point
      when groups[1]
        user_info.point_divine_principle += @activity.point
      when groups[2]
        user_info.point_father_message   += @activity.point
      when groups[3]
        user_info.point_faith            += @activity.point
      when groups[4]
        user_info.point_practice         += @activity.point
      end

      user_info.save
    end

    redirect_to :new_activity, notice: "活動「#{@activity.title}」を登録しました。"
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :memo, :point, :group, :achieved_at)
  end
end
