class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
    end

    def check_admin_user
      unless current_user.admin?
        respond_to do |format|
          format.html {redirect_to root_path, notice: 'You do not have an authority.' }
        end
      end
    end

  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:sign_up) << :tel
      devise_parameter_sanitizer.for(:sign_up) << :line
      devise_parameter_sanitizer.for(:sign_up) << :facebook
      devise_parameter_sanitizer.for(:account_update) << :name
      devise_parameter_sanitizer.for(:account_update) << :tel
      devise_parameter_sanitizer.for(:account_update) << :line
      devise_parameter_sanitizer.for(:account_update) << :facebook
    end
end
