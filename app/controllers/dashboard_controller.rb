
class DashboardController < ApplicationController

  def index
    @users = UserSearch.new(params[:user])


    # @conn = Faraday.new(url: "https://api.github.com") do |faraday|
    #   faraday.adapter Faraday.default_adapter
    # end
    #
    # response = @conn.get("/users/#{user}.json")
    #
    # @repos = JSON.parse(response.body, symbolize_names: true)
  end

end
