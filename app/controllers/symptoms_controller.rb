class SymptomsController < ApplicationController
  before_action :require_login
  before_action :set_symptom, only: %i[ show edit update destroy ]

  # GET /symptoms or /symptoms.json
  def index
    @symptoms = current_user.symptoms
    @symptoms_chart_data = current_user.chart_by_day_and_severity_for_all_symptoms
    @notes_chart_data = current_user.notes.collect { |note| {x: note.created_at.to_i * 1000, text: "<a href='#{edit_note_path(note)}'>#{note.title}</a>" }}
  end

  # GET /symptoms/1 or /symptoms/1.json
  def show
    @symptoms_chart_data= @symptom.chart_by_day_and_severity
    @measurements = @symptom.measurements
  end

  # GET /symptoms/new
  def new
    @symptom = current_user.symptoms.new
  end

  # GET /symptoms/1/edit
  def edit
  end

  # POST /symptoms or /symptoms.json
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

  # PATCH/PUT /symptoms/1 or /symptoms/1.json
  def update
    respond_to do |format|
      if @symptom.update(symptom_params)
        format.html { redirect_to symptom_url(@symptom), notice: I18n.it("Symptom was successfully updated.", current_user.preferred_language) }
        format.json { render :show, status: :ok, location: @symptom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /symptoms/1 or /symptoms/1.json
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
end
