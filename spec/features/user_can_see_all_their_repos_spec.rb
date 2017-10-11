
require 'rails_helper'

feature "User can see list of repos" do
  it "from their profile" do
    stub_omniauth
    visit "/"

    expect(page).to have_content("7 Results")
    expect(page).to have_css('.repos', count: 7)

    within(first('.member')) do
      expect(page).to have_css('.name')
      expect(page).to have_css('.full_name')
    end

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
