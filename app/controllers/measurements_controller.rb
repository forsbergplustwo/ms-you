class MeasurementsController < ApplicationController
  before_action :require_login
  before_action :set_measurement, only: %i[destroy]

  def new
    @symptom = current_user.symptoms.find(params[:symptom_id])
    render "new"
  end

  def destroy
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to symptom_url(@measurement.symptom), notice: I18n.it("Measurement was successfully destroyed.", current_user.preferred_language) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_measurement
    @measurement = current_user.measurements.find(params[:id])
  end
end
