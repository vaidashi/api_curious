
class DashboardPresenter

  def initialize(user)
    @user = user
  end

  def repos
    api_repo_call = GithubService.new.repo_call

    present_repos(api_repo_call)
  end

  def present_repos(api_repo_call)
    api_repo_call.map do |repo|
      Repo.new(repo)
    end
  end

end
