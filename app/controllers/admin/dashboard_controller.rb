class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!
  include Devise
  def index
      # @courses = Course.all
      @pagy, @courses = pagy(Course.all)
      
    end
end