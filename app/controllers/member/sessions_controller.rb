# frozen_string_literal: true

class Member::SessionsController < Devise::SessionsController
  #before_action :member_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

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
  private

  #def member_state
    #@member = Member.find_by(email: params[:member][:email])
    #return if @member.nil?
    #return unless @member.valid_password?(params[:member][:password])
      #if @member.is_active == false
        #flash[:alert] = "退会済みです。再度、新規登録をお願いいたします。"
        #redirect_to new_member_registration_path
      #end
  #end
  
end
