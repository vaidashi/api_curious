
require 'rails_helper'

feature "User can view list of organizations they are a member of" do
  it "on their profile once they log in" do
    stub_omniauth

    visit '/dashboard'

    expect(page).to have_css('.organization', count: 1)
  end
end




def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    "provider" => "github",
    "uid" => "25907721",
    "credentials" => { "token" => ENV["GITHUB_TOKEN"] },
    "info" => {
      "nickname" => "vaidashi",
      "email"    => "sandwich@gmail.com",
      "name"     => "Ashish Vaid",
      "urls" => {
        "Github" => "https:://api.github.com/users/vaidashi/repos"
      },
    }
  })
end
