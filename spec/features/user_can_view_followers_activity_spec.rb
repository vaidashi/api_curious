
require 'rails_helper'

feature "User can view followers activity" do
  let(:user) { User.new(
                        uid:      '999999',
                        nickname: 'vaidashi',
                        token:    ENV['GITHUB_TOKEN'])
                      }

  it "once logged in" do
    VCR.use_cassette("find_followers_activity") do

      allow_any_instance_of(ApplicationController).to receive(
      :current_user).and_return(user)

      visit '/dashboard'

      expect(page).to have_content("boveus did ForkEvent for vaidashi/uncle_franks_emporium on 2017-09-27T05:25:30Z")
    end
  end
end
