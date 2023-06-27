class UsersController < Clearance::UsersController
  before_action :require_login, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to edit_user_path(current_user), notice: I18n.it("Settings successfully updated.", current_user.preferred_language) }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: I18n.it("Account was successfully destroyed.", current_user.preferred_language) }
    end
  end

  private

  def user_params
    params.require(:user).permit(:preferred_language, :email, :password)
  end
end
