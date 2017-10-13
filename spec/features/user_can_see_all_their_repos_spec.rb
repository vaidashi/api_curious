
require 'rails_helper'

feature "User can see list of repos" do
  let(:user) { User.new(
                        uid:      '999999',
                        nickname: 'guy',
                        token:    ENV['GITHUB_TOKEN'])
                      }

  it "from their profile" do
    # stub_omniauth
    VCR.use_cassette("find_user_repos") do
    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user)

    visit "/dashboard"

    expect(page).to have_css('.repo', count: 30)
  end
end
end

  # def stub_omniauth
  #   OmniAuth.config.test_mode = true
  #   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  #     "provider" => "github",
  #     "uid" => "25907721",
  #     "credentials" => { "token" => ENV["GITHUB_TOKEN"] },
  #     "info" => {
  #       "nickname" => "vaidashi",
  #       "email"    => "sandwich@gmail.com",
  #       "name"     => "Ashish Vaid",
  #       "urls" => {
  #         "Github" => "https:://api.github.com/users/vaidashi/repos"
  #       },
  #     }
  #   })
  # end
