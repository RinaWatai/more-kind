class Admin < ApplicationRecord
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 管理者認証に使用するメソッド名を修正する
  # 例: authenticate_admin! -> authenticate_admin_user!
  # def authenticate_admin!
  #   ...
  # end

  def authenticate_admin_user!
    # 管理者認証の実装
  end
end
