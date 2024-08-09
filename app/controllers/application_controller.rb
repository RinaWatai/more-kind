class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    member_root_path(resource)
  end
end
