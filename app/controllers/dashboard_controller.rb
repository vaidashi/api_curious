
class DashboardController < ApplicationController

  def index

    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end

     response = @conn.get("/user")

     @repos = JSON.parse(response.body, symbolize_names: true)



    # @users = GithubService.new(params[:user])


    # @conn = Faraday.new(url: "https://api.github.com") do |faraday|
    #   faraday.adapter Faraday.default_adapter
    # end
    #
    # response = @conn.get("/users/#{user}.json")
    #
    # @repos = JSON.parse(response.body, symbolize_names: true)
  end

end
