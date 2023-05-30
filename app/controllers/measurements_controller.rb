class MeasurementsController < ApplicationController

    before_action :set_measurement, only: %i[ destroy ]

    # DELETE /symptoms/1 or /symptoms/1.json
    def destroy
      @measurement.destroy

      respond_to do |format|
        format.html { redirect_to symptom_url(@measurement.symptom), notice: "Measurement was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

end
