
class Organization

  attr_reader :login

  def initialize(org)
    @login = org[:login]
  end

end
