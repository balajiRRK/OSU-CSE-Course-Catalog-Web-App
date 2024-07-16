class GradersController < ApplicationController
  before_action :set_grader, only: %i[ show edit update destroy ]

  # GET /graders or /graders.json
  def index
    @graders = Grader.all
  end

  # GET /graders/1 or /graders/1.json
  def show
  end

  # GET /graders/new
  def new
    @grader = Grader.new
  end

  # GET /graders/1/edit
  def edit
  end

  # POST /graders or /graders.json
  def create
    @grader = Grader.new(grader_params)

    respond_to do |format|
      if @grader.save
        format.html { redirect_to grader_url(@grader), notice: "Grader was successfully created." }
        format.json { render :show, status: :created, location: @grader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graders/1 or /graders/1.json
  def update
    respond_to do |format|
      if @grader.update(grader_params)
        format.html { redirect_to grader_url(@grader), notice: "Grader was successfully updated." }
        format.json { render :show, status: :ok, location: @grader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graders/1 or /graders/1.json
  def destroy
    @grader.destroy!

    respond_to do |format|
      format.html { redirect_to graders_url, notice: "Grader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grader
      @grader = Grader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grader_params
      params.require(:grader).permit(:lname, :fname, :email)
    end
end
