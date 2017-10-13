
class GithubService

  def initialize
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end
  end

  def repo_call
     repo_response = @conn.get("/user/repos")
     @user_repos = JSON.parse(repo_response.body, symbolize_names: true)
  end


end
