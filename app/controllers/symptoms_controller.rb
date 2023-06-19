class SymptomsController < ApplicationController
  before_action :require_login
  before_action :set_symptom, only: %i[ show edit update destroy ]

  def index
    @symptoms = current_user.symptoms
    @symptoms_chart_data = current_user.chart_by_day_and_severity_for_all_symptoms
    @notes_chart_data = notes_chart_data
  end

  def show
    @symptoms_chart_data= @symptom.chart_by_day_and_severity
    @measurements = @symptom.measurements
    @confetti_time = confetti_time?
  end

  def new
    @symptom = current_user.symptoms.new
  end

  def edit
  end

  def create
    @symptom = current_user.symptoms.new(symptom_params)

    respond_to do |format|
      if @symptom.save
        format.html { redirect_to symptom_url(@symptom), notice: I18n.it("Symptom was successfully created", current_user.preferred_language) }
        format.json { render :show, status: :created, location: @symptom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @symptom.update(symptom_params)
        format.html { redirect_to symptom_url_with_possible_confetti, notice: I18n.it("Symptom was successfully updated.", current_user.preferred_language) }
        format.json { render :show, status: :ok, location: @symptom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @symptom.destroy

    respond_to do |format|
      format.html { redirect_to symptoms_url, notice:I18n.it("Symptom was successfully destroyed.", current_user.preferred_language) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_symptom
      @symptom = current_user.symptoms.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def symptom_params
      params.require(:symptom).permit(:title, measurements_attributes: [:created_at, :severity, :description])
    end

    def symptom_url_with_possible_confetti
      if severity_changing_to_none?
        symptom_url(@symptom, confetti: true)
      else
        symptom_url(@symptom)
      end
    end

    def notes_chart_data
      current_user.notes.collect { |note| {x: note.created_at.to_i * 1000, text: "<a href='#{edit_note_path(note, back_to: symptoms_path)}'>#{note.title}</a>" }}
    end

    def confetti_time?
      params[:confetti].present? && params[:confetti] == "true"
    end

    def severity_changing_to_none?
      symptom_params[:measurements_attributes].present? && symptom_params[:measurements_attributes].values.any? { |measurement| measurement[:severity].present? && measurement[:severity].to_i == 0
    end
end
