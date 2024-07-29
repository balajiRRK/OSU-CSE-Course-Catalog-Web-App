class UserApplicationsController < ApplicationController
  
  def show
    @user= User.find(:id)
    
  end
end
