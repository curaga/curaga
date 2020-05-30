require 'rails_helper'

RSpec.describe NamespaceMembership, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:namespace) }
    it { is_expected.to belong_to(:user) }
  end
end
