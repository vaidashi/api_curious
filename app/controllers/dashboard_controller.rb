
class DashboardController < ApplicationController

  def index

    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end

     response = @conn.get("/user")

     @results = JSON.parse(response.body, symbolize_names: true)


     ##queries

     repo_response = @conn.get("/user/repos")
     @repos = JSON.parse(repo_response.body, symbolize_names: true)
  end



end
