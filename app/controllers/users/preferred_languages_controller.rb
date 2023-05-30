module Users
  class PreferredLanguagesController < ApplicationController
    before_action :require_login

    def show
      if User::AVAILABLE_LANGUAGES.include?(params[:language])
        current_user.update!(preferred_language: params[:language])
      end
      redirect_to root_path
    end
  end
end
