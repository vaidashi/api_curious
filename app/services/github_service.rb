
# class GithubService
#
#   def initialize(user)
#     @user = user
#     @conn = Faraday.new(url: "https://api.github.com") do |faraday|
#       faraday.adapter Faraday.default_adapter
#      end
#   end
#
#
#   def self.find_user_repos
#      response = @conn.get("/user/repos")
#
#      @repos = JSON.parse(response.body, symbolize_names: true)
#
#
#   end
#
# end
