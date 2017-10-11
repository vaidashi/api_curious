
require 'rails_helper'


RSpec.feature "user logs in/out" do
  scenario "using github oauth" do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Sign in with Github")
    click_link "Sign in with Github"

    expect(page).to have_link("Logout")
    click_link "Logout"

    expect(page).to have_link("Sign in with Github")
  end
end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider" => "github",
      "uid" => "12345678",
      "credentials" => { "token" => "biglongfaketokenmadeupfortest" },
      "info" => {
        "nickname" => "test123",
        "email"    => "test@email.com",
        "name"     => "Fake Guy",
        "urls" => {
          "Github" => "www.fake-github.com"
        },
      }
    })
  end
