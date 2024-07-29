class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!, :authenticate_status!
  include Devise
  def index
      # @courses = Course.all
      @pagy_unassigned, @no_grader = pagy(Course.all, page_param: :no_grader)
      @pagy_course, @courses = pagy(Course.all,page_param: :course_page)
      @pagy_user, @users = pagy(User.all,page_param: :user_page)
      @pagy_pending, @pending_users = pagy( User.where(status: "pending").all,page_param: :pending_page)
    end
end