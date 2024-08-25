# frozen_string_literal: true

class Member::SessionsController < Devise::SessionsController
  #before_action :member_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_member, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
protected

  # 退会済みのユーザーがログインできないようにする（退会処理とは別）
  def reject_member
    @member = Member.find_by(email: params[:member][:email])
    # 存在しているかどうか分岐
    if @member
      # 退会フラグが退会済みか有効化判断
      if @member.valid_password?(params[:member][:password]) && (@member.is_deleted == true)
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
        redirect_to new_member_registration_path
      end
    else
      # そもそも存在していなかった場合
      flash[:notice] = "該当するユーザーが見つかりません"
    end
  end

  
end
