
class DashboardController < ApplicationController

  def index
    @dashboard_display = DashboardPresenter.new(current_user)
  end
  
end
