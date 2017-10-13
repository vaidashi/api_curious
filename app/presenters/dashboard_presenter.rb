
class DashboardPresenter

  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def repos
    api_repo_call = GithubService.new(current_user).repo_call

    present_repos(api_repo_call)
  end

  def present_repos(api_repo_call)
    api_repo_call.map do |repo|
      Repo.new(repo)
    end
  end

  def orgs
    api_org_call = GithubService.new(current_user).org_call

    present_orgs(api_org_call)
  end

  def present_orgs(api_org_call)
    api_org_call.map do |org|
      Organization.new(org)
    end
  end


end
