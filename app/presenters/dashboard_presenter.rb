
class DashboardPresenter

  def initialize(user)
    @user = user
  end

  def repos
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end

     repo_response = @conn.get("/user/repos")
     @user_repos = JSON.parse(repo_response.body, symbolize_names: true)

     new_user_repos = @user_repos.map do |repo|
       Repo.new(repo)
     end
  end



end
