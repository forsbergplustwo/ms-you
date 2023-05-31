class ApplicationController < ActionController::Base
  include Clearance::Controller

  def current_user
    @current_user ||= if signed_in?
      super
    else
      OpenStruct.new(preferred_language: session[:preferred_language] || "English")
    end
  end
end
