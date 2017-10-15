
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

  def starred_repos
    api_starred_call = GithubService.new(current_user).starred_call

    present_starred_repos(api_starred_call)
  end

  def present_starred_repos(api_starred_call)
    @starred_count = api_starred_call.count
  end

  def following_list
    api_following_call = GithubService.new(current_user).following_call

    present_following_list(api_following_call)
  end

  def present_following_list(api_following_call)
    api_following_call.map do |follower|
      follower[:login]
    end
  end

  def follower_list
    api_followers_call = GithubService.new(current_user).followers_call

    present_followers_list(api_followers_call)
  end

  def present_followers_list(api_followers_call)
    api_followers_call.map do |follower|
      follower[:login]
    end
  end

  def my_commits
    api_commits_call = GithubService.new(current_user).user_commits_call

    present_user_commits(api_commits_call)
  end

  def present_user_commits(api_commits_call)
    commits = {}
    api_commits_call.map do |event|
       if event[:payload][:commits]
         event[:payload][:commits].each {|commit| commits[commit[:message]] = event[:repo][:name]}
       end
     end
     commits
  end

end
