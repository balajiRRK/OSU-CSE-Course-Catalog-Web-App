class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!, :authenticate_status!
  include Devise
  def index
      # @courses = Course.all
      @pagy, @courses = pagy(Course.all)
      @pagy, @users = pagy(User.all)
      @pagy, @pending_users = pagy( User.where(status: "pending").all)
    end
end