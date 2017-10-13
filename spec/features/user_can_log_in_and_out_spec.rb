
require 'rails_helper'


RSpec.feature "user logs in/out" do

  let(:user) { User.new(
                        uid:      '999999',
                        nickname: 'guy',
                        token:    ENV['GITHUB_TOKEN'])
                      }


  scenario "using github oauth" do
    # stub_omniauth

    VCR.use_cassette("find_user") do
    allow_any_instance_of(ApplicationController).to receive(
    :current_user).and_return(user)

    visit "/dashboard"
    # visit root_path
    #
    # expect(page).to have_link("Sign in with Github")
    # click_link "Sign in with Github"

    expect(page).to have_link("Logout")
    click_link "Logout"

    expect(page).to have_link("Sign in with Github")
  end
end
end

  # def stub_omniauth
  #   OmniAuth.config.test_mode = true
  #   OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
  #     "provider" => "github",
  #     "uid" => "12345678",
  #     "credentials" => { "token" => "biglongfaketokenmadeupfortest" },
  #     "info" => {
  #       "nickname" => "test123",
  #       "email"    => "test@email.com",
  #       "name"     => "Fake Guy",
  #       "urls" => {
  #         "Github" => "www.fake-github.com"
  #       },
  #     }
  #   })
  # end
