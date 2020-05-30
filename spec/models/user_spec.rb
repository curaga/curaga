# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    user = FactoryBot.build(:user)

    expect(user).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:documents).with_foreign_key(:owner_id).inverse_of(:owner).dependent(:destroy) }
    it { is_expected.to have_many(:memberships).class_name('NamespaceMembership').dependent(:destroy) }
    it { is_expected.to have_many(:namespaces).through(:memberships) }
  end

  it '#default_namespace' do
    user = FactoryBot.create(:user)

    expect(user.default_namespace).to eq(Namespace.find_by(slug: user.username))
  end
end
