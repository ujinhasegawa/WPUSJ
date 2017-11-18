class HomeController < ApplicationController
  def index
    @user = current_user
    @info = @user.information
    @activities_timeline = @user.activity.order('created_at desc')
		# myユーザの簡単な情報
		# タイムライン
		# リンク
  end

  def my_page
		# 私のステータス
		# 活動履歴
		# リンク
  end
end
