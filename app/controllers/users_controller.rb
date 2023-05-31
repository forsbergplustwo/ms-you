class UsersController < Clearance::UsersController
  before_action :require_login, only: :destroy

  def destroy
    current_user.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: I18n.it("Account was successfully destroyed.", current_user.preferred_language) }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:preferred_language, :email, :password)
  end
end
