
require 'rails_helper'

feature "User can view recent activity" do
  let(:user) { User.new(
                        uid:      '999999',
                        nickname: 'vaidashi',
                        token:    ENV['GITHUB_TOKEN'])
                      }

  it "specifically recent commits" do
    VCR.use_cassette("find_recent_commits") do

      allow_any_instance_of(ApplicationController).to receive(
      :current_user).and_return(user)

      visit '/dashboard'

      expect(page).to have_content("moving user search info call to model commit from vaidashi/api_curious repo")
    end
  end
end
