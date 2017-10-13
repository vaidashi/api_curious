
class Repo

  attr_reader :name

  def initialize(user_repos)
    @name = user_repos[:name]
  end

end
