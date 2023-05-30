class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    # @current_user ||= User.find_by(id: session[:user_id])
    @current_user ||= OpenStruct.new(
      preferred_language: "English",
      name: "John Doe",
      initials: "JD"
    )
  end

end
