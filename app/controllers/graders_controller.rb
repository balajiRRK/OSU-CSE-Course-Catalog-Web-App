class GradersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_grader, only: [:show, :edit, :update]

  def new
    @grader = Grader.new
    # Initialize empty availability for all days
    @grader.availability = Grader::DAYS_OF_WEEK.each_with_object({}) { |day, hash| hash[day] = ['', ''] }
  end

  def create
    @grader = Grader.new(grader_params)
    process_availability
    # Debug output to check availability after processing
    puts "Availability after processing: #{@grader.availability.inspect}"
    if @grader.save
      # Debug output to check availability after save
      puts "Availability after save: #{@grader.reload.availability.inspect}"
      redirect_to @grader, notice: 'Grader application was successfully submitted.'
    else
      render :new
    end
  end

  def show
  end

  def index
    @graders = Grader.all
  end

  def edit
  end

  def update
    process_availability
    # Debug output to check availability after processing
    puts "Availability after processing: #{@grader.availability.inspect}"
    if @grader.update(grader_params)
      # Debug output to check availability after update
      puts "Availability after update: #{@grader.reload.availability.inspect}"
      redirect_to @grader, notice: 'Grader application was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_grader
    @grader = Grader.find(params[:id])
  end

  def grader_params
    params.require(:grader).permit(
      :name, :email, :phone_number, :courses_wish_to_grade, :courses_qualified_to_grade,
      availability: {}
    )
  end

  def process_availability
    return unless params[:grader][:availability]
    
    # Transform the availability hash to remove blank entries
    @grader.availability = params[:grader][:availability].to_h.transform_values do |times|
      times.map(&:presence).compact
    end
    # Debug output to check processed availability
    puts "Processed availability: #{@grader.availability.inspect}"
  end
end
