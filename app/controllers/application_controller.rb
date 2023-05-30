class ApplicationController < ActionController::Base
  include Clearance::Controller

  def current_user
    user = super
    return user if user.present?

    OpenStruct.new(preferred_language: session[:preferred_language] || "English")
  end
end
