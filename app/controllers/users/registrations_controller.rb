class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super

    raise if current_user.nil?

    user = current_user

    ActiveRecord::Base.transaction do
      user.build_information(params.require(:user_name).permit(:name))
      user.save!
      user.information.update!(point_month: 0, point_year: 0, point_lifetime: 0,
                               point_bible: 0, point_divine_principle: 0, point_father_message: 0,
                               point_faith: 0, point_practice: 0)
    end

  rescue => e
  # 例外が発生した場合
    user.destroy if not user.nil?

    # リダイレクトさせればいいかも？
  end

  # GET /resource/edit
  def edit
    @info      = current_user.information
    @countries = CountryMaster.all

    if not @info.country_master_id.nil?
      @areas           = CountryMaster.find(@info.country_master_id).areas
      @country_defo_id = @info.country_master_id
      @area_defo_id    = @info.area_master_id
    else
      # もし、地域が未設定の場合は初期値を日本にしておく
      @areas           = CountryMaster.find_by_name('日本').areas
      @country_defo_id = CountryMaster.find_by_name('日本').id
      @area_defo_id    = CountryMaster.find_by_name('日本').areas.first.id
    end

    super
  end

  # PUT /resource
  def update
    @info = current_user.information
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
