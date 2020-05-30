# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Namespace, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:documents).dependent(:destroy) }
    it { is_expected.to have_many(:memberships).class_name('NamespaceMembership').dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:memberships) }
  end
end
