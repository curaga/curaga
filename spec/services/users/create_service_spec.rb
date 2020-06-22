# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::CreateService do
  describe '#execute' do
    context 'with valid params' do
      let(:service) { described_class.new(FactoryBot.attributes_for(:user)) }

      it 'returns a persisted user' do
        expect(service.execute).to be_persisted
      end

      it 'creates a default namespace for user' do
        expect(service.execute.default_namespace).to be_persisted
      end
    end
  end
end
