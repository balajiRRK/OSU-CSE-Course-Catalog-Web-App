class GradersController < ApplicationController
  def new
    @grader = Grader.new
  end

  def create
    @grader = Grader.new(grader_params)
    if @grader.save
      redirect_to @grader, notice: 'Grader was successfully created.'
    else
      render :new
    end
  end

  private

  def grader_params
    params.require(:grader).permit(:name, :subject, :contact_info, :courses_wish_to_grade, :courses_qualified_to_grade)
  end
end
