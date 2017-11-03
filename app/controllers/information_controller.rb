class InformationController < ApplicationController

  def update
    current_user.information.update!(information_params)

    redirect_to :edit_user_registration, notice: "登録情報を更新しました。"
  end

  private

  def information_params
    params.require(:information).permit(:name, :country, :area)
  end
end
