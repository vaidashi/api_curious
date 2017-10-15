
class DashboardController < ApplicationController

  def index

    #final goal
    @dashboard_display = DashboardPresenter.new(current_user)
    #final goal



    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end


     following_activity = @conn.get("/users/#{current_user.nickname}/received_events")
     @their_activity = JSON.parse(following_activity.body, symbolize_names: true)
    #  binding.pry
  end



end
