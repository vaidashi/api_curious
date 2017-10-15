
require 'rails_helper'

feature "User can view their basic info" do
  let(:user) { User.new(
                        uid:      '999999',
                        nickname: 'vaidashi',
                        token:    ENV['GITHUB_TOKEN'])
                      }

    it "once they log in" do
      VCR.use_cassette("find_user_info") do

      allow_any_instance_of(ApplicationController).to receive(
      :current_user).and_return(user)

      visit '/dashboard'
# save_and_open_page
      expect(page).to have_content("starred count: 1")
    end
  end

end
