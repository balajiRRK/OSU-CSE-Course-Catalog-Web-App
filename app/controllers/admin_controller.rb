class AdminController < ApplicationController
    before_action :authenticate_admin!
    def index
        # @courses = Course.all
        @pagy, @courses = pagy(Course.all)
      end
end
