module Users
  class PreferredLanguagesController < ApplicationController

    def show
      if User::AVAILABLE_LANGUAGES.include?(params[:language]) || User::AVAILABLE_LANGUAGES_FOR_FUN.include?(params[:language])
        if signed_in?
          current_user.update!(preferred_language: params[:language])
        else
          session[:preferred_language] = params[:language]
        end
      end
      redirect_to root_path
    end
  end
end
