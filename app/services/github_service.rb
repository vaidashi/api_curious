
class GithubService

  def initialize(user)
    @user = user
  end


  def self.find_user_repos
    binding.pry
    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
     end

     response = @conn.get("/users/#{user}/repos.json")

     @repos = JSON.parse(response.body, symbolize_names: true)
  end

end
