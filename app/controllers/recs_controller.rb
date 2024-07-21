class RecommendationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:new, :create]
    before_action :verify_instructor, only: [:new, :create]
  
    def new
      @recommendation = Recommendation.new
    end
  
    def create
      @recommendation = Recommendation.new(recommendation_params)
      @recommendation.instructor_id = current_user.id
      @recommendation.course_id = @course.id
  
      if @recommendation.save
        redirect_to course_path(@course), notice: 'Recommendation was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_course
      @course = Course.find(params[:course_id])
    end
  
    def recommendation_params
      params.require(:recommendation).permit(:student_id, :message)
    end
  
    def verify_instructor
      redirect_to(root_path, alert: "Not authorized") unless current_user.instructor?
    end
  end  