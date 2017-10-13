require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of :nickname }
    it { is_expected.to validate_presence_of :uid }
  end
end
