
class GithubService

  def self.find_user_repos
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
     end

     response = @conn.get("/users/#{user}/repos.json")

     @repos = JSON.parse(response.body, symbolize_names: true)
  end

end
