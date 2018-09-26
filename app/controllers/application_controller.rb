class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  # #for custom error page
  # def error
  #   render status_code.to_s, status: (params[:code] || 500)
  # end
end
