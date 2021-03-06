
class GithubService


  def initialize(current_user)
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["Authorization"] = "token #{ENV['GITHUB_TOKEN']}"
      faraday.adapter Faraday.default_adapter
     end

     @current_user = current_user
  end

  def repo_call
     repo_response = @conn.get("/user/repos")
     @user_repos = JSON.parse(repo_response.body, symbolize_names: true)
  end

  def org_call
    org_response = @conn.get("/users/#{current_user.nickname}/orgs")
    @orgs = JSON.parse(org_response.body, symbolize_names: true)
  end

  def starred_call
     starred_response = @conn.get("/users/#{current_user.nickname}/starred")
     @starred = JSON.parse(starred_response.body, symbolize_names: true)
  end

  def following_call
    following_response = @conn.get("/users/#{current_user.nickname}/following")
    @following = JSON.parse(following_response.body, symbolize_names: true)
  end

  def followers_call
    followers_response = @conn.get("/users/#{current_user.nickname}/followers")
    @followers = JSON.parse(followers_response.body, symbolize_names: true)
  end

  def user_commits_call
    my_activity_response = @conn.get("/users/#{current_user.nickname}/events")
    @result = JSON.parse(my_activity_response.body, symbolize_names: true)
  end

  def followers_activity_call
    following_activity = @conn.get("/users/#{current_user.nickname}/received_events")
    @their_activity = JSON.parse(following_activity.body, symbolize_names: true)
  end

  private

  attr_reader :current_user


end
